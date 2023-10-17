import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
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
    final url = Uri.http('localhost:8000', '/api/mobiles');
    print(url);

    final response = await http.get(url);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);
      List<Mobile> _fetchedList = [];

      for (var item in responseData) {
        _fetchedList.add(
          Mobile(
            title: item['title'],
            status: item['status'],
            price: item['price'],
            battery: item['battery'],
            quantity: item['quantity'],
            storage: item['storage'],
            ram: item['ram'],
            cameraFront: item['front_camera'],
            cameraBack: item['back_camera'],
          ),
        );
      }

      setState(() {
        _mobileList = _fetchedList;
      });
    }
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
      appBar: AppBar(
        backgroundColor: mainRed,
      ),
      body: Column(
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
