import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/mobile.dart';

class ApiServices {
  static const baseUrl = 'http://localhost:8000/api';
  Future<List<Mobile>> fetchMobiles() async {
    final url = Uri.parse('$baseUrl/mobiles');
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
