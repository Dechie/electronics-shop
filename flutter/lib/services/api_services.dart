import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/laptop.dart';
import '../models/mobile.dart';

const baseUrl = 'http://localhost:8000/api';

class ApiServices {
  Future<List<Laptop>> fetchLaptops() async {
    print('fetch laptops called');
    await Future.delayed(const Duration(seconds: 4));
    final url = Uri.parse('$baseUrl/laptopes');
    List<Laptop> fetchedList = [];

    try {
      final response = await http.get(url);
      //print('fetchls status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);

        for (var item in responseData) {
          fetchedList.add(Laptop.fromJson(item));
        }
      }
    } catch (e) {
      print(e.toString());
    }

    return fetchedList;
  }

  Future<List<Mobile>> fetchMobiles() async {
    print('fetch mobiles called');
    await Future.delayed(const Duration(seconds: 4));
    final url = Uri.parse('$baseUrl/mobiles');
    List<Mobile> fetchedList = [];

    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);

      for (var item in responseData) {
        fetchedList.add(Mobile.fromJson(item));
      }
      print("list: ${fetchedList.length}");
    }

    return fetchedList;
  }
}
