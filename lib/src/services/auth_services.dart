import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chat/src/global/environment.dart';

class AuthServices with ChangeNotifier {
  //Final del usuario
    final url = Uri.parse('${ Environment.apiUrl }/login');

  Future login(String email, String password) async {

    final data = {
      'email': email,
      'password': password
    };



    final resp = await http.post(url,
        body: jsonEncode(data),
        headers: { 'Content-Type': 'application/json' }
    );

    print(resp.body);
  }
}
