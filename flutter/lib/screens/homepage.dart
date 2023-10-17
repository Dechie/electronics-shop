import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:mobile_shop/services/api_services.dart';
import 'package:mobile_shop/widgets/elementary_item.dart';
import 'package:mobile_shop/widgets/special_item.dart';

import '../models/mobile.dart';
import 'package:mobile_shop/constants.dart';

import '../widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["All", "Latest", "Samsung", "Tecno", "Infinix"];
  List<Mobile> _mobileList = [];

  void _fetchMobiles() async {
    List<Mobile> mobile_list = [];
    final api = ApiServices();

    mobile_list = await api.fetchMobiles();

    setState(() {
      _mobileList = mobile_list;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchMobiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainGrey,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: mainRed,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: mainRed,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: mainRed,
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: mainRed,
            ),
            label: 'Me',
          ),
        ],
      ),
      body: SafeArea(
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
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: CustomText(
                text: 'All Categories',
                color: Colors.black,
                size: 20,
              ),
            ),
            buildGridView(context, _mobileList),
          ],
        ),
      ),
    );
  }
}

buildCategoryTabs(List<String> categories) {
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
  return Expanded(
    child: Container(
      //height: MediaQuery.of(context).size.height * .6,
      height: 350,
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
    ),
  );
}

buildSpecialView(BuildContext context, List<Mobile> phonesList) {
  return Expanded(
    child: Container(
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
    ),
  );
}
