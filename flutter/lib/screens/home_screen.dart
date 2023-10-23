import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/mobile.dart';
import '../services/api_services.dart';
import '../widgets/custom_text.dart';
import '../widgets/elementary_item.dart';
import '../widgets/special_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Mobile> _mobileList = [];

  void _fetchMobiles() async {
    List<Mobile> mobList = [];
    final api = ApiServices();

    mobList = await api.fetchMobiles();

    setState(() {
      _mobileList = mobList;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchMobiles();
  }

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
                      backgroundColor: MaterialStateProperty.all(myOrange)),
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
          buildSpecialView(context, _mobileList),
          buildCategoryTabs(),
          buildGridView(context, _mobileList),
        ],
      ),
    );
  }
}

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

buildGridView(BuildContext context, List<Mobile> phonesList) {
  return Container(
    //height: MediaQuery.of(context).size.height * .6,
    height: 250,
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
          child: ElementaryMobileItem(mobile: phonesList[index]),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 15),
      ),
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
