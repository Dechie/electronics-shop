import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_shop/widgets/laptop_item.dart';

import '../constants.dart';
import '../models/mobile.dart';
import '../services/providers.dart';
import '../widgets/custom_text.dart';
import '../widgets/elementary_item.dart';
import '../widgets/special_item.dart';

buildCategoryTabs() {
  List<String> categories = ['All', 'Samsung', 'Tecno'];
  return Container(
    margin: const EdgeInsets.all(10),
    height: 40,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ...categories.map(
          (item) => Card(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              width: 70,
              height: 15,
              child: Text(item),
            ),
          ),
        ),
      ],
    ),
  );
}

buildGridView(BuildContext context, List<Mobile> phonesList, WidgetRef ref) {
  final mobs = ref.watch(mobilesProvider);
  final laptops = ref.watch(laptopsProvider);
  return SizedBox(
    height: 400,
    width: double.infinity,
    child: Column(
      children: [
        mobs.when(
          data: (mobs) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 250,
                width: double.infinity,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: mobs.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
                    child: ElementaryMobileItem(mobile: mobs[index]),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 15),
                ),
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Text(
              error.toString(),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        const SizedBox(height: 30),
        laptops.when(
          data: (laptops) {
            return Padding(
              padding: const EdgeInsets.all(9),
              child: SizedBox(
                height: 250,
                width: double.infinity,
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        ElementaryLaptopItem(laptop: laptops[index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: laptops.length),
              ),
            );
          },
          error: (error, stacktrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    ),
  );
}

buildSpecialView(BuildContext context, List<Mobile> phonesList) {
  return Container(
    //height: MediaQuery.of(context).size.height * .6,
    height: 220,
    width: MediaQuery.of(context).size.width * 0.9,
    margin: const EdgeInsets.all(10),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: phonesList.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
          child: SpecialMobileItem(mobile: phonesList[index]),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 15),
      ),
    ),
  );
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final List<Mobile> _mobileList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const SearchBar(),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(myOrange)),
                  onPressed: () {},
                  child: const Icon(Icons.shopping_cart)),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: CustomText(
              text: 'Latest',
              color: Colors.black,
              size: 20,
            ),
          ),
          //buildSpecialView(context, _mobileList),
          buildCategoryTabs(),
          buildGridView(context, _mobileList, ref),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    //_fetchMobiles();
  }

  // void _fetchMobiles() async {
  //   List<Mobile> mobList = [];
  //   final api = ApiServices();

  //   mobList = await api.fetchMobiles();

  //   setState(() {
  //     _mobileList = mobList;
  //   });
  // }
}
