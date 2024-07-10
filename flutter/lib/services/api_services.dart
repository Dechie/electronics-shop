import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/laptop.dart';
import '../models/mobile.dart';

const baseUrl = 'http://localhost:8000/api';



class ApiServices {
  Future<List<Laptop>> fetchLaptops() async {
    await Future.delayed(const Duration(seconds: 4));
    final url = Uri.parse('$baseUrl/mobiles');
    List<Laptop> fetchedList = [];

    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);

      for (var item in responseData) {
        fetchedList.add(Laptop.fromJson(item));
      }
    }

    return fetchedList;
  }

  Future<List<Mobile>> fetchMobiles() async {
    await Future.delayed(const Duration(seconds: 4));
    final url = Uri.parse('$baseUrl/laptops');
    List<Mobile> fetchedList = [];

    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);

      for (var item in responseData) {
        fetchedList.add(Mobile.fromJson(item));
      }
    }

    return fetchedList;
  }
}

class LaptopServices {}
