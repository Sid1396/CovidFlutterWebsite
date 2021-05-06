import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';

import 'Constants.dart';

class ApiClient{
  Future<http.Response> getAllData() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*'
    };
    final response =
    await http.get("$BASE_URL/data.json", headers: headers);
    return response;
  }
}
