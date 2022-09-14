import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:e_commerce_qlicue/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  User user = User(email: '', password: '');
  login({required String email, required String password}) {
    user = User(email: email, password: password);
    notifyListeners();
  }

  Future<Map<String, dynamic>> register(
      {required String name,
      required String phone,
      required String email,
      required String password}) async {
    Map<String, dynamic> body = {
      "name": name,
      "phone": phone,
      "email": email,
      'password': password
    };

    http.Response response = await http.post(Uri.parse('${api}api/login'),
        body: json.encode(body),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'});
    print(response.body);

    log(response.body, name: 'RESPONSE');

    Map<String, dynamic> responseMap = json.decode(response.body);

    user = User(name: name, phone: phone, email: email, password: password);
    notifyListeners();

    return responseMap;
  }
}

class User {
  final String? name;
  final String? phone;
  final String email;
  final String password;

  User({this.name, this.phone, required this.email, required this.password});
}
