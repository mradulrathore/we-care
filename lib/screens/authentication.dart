import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Authentication with ChangeNotifier {
  Future<void> signUp(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBl9gxfB3bb218wVS0tkrWCCXVBb4kTnt8';

    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
//      print(responseData);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> logIn(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAnsO8i4KNNS9LiCRmtEUtwnhOAeDEr9cs';

    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
//      print(responseData);

    } catch (error) {
      throw error;
    }
  }
}
