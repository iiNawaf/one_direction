import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:project/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const domain = "https://one-direction-app.000webhostapp.com/index.php/auth/";

class AuthProvider extends ChangeNotifier {
  User loggedinUser;

  Future<void> signup(String username, String password) async {
    final url = domain + "signup";
    final response = await http.post(
      url,
      body: json.encode({
        "username": username,
        "password": password,
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );

    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception(extractedResponse['error']);
    }
  }

  Future<void> login(String username, String password) async {
    final url = domain + "login";
    final response = await http.post(
      url,
      body: json.encode({
        "username": username,
        "password": password,
      }),
      headers: {
        "Content-Type": "application/json",
      },
    );

    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception(extractedResponse['error']);
    } else {
      final foundUser = extractedResponse['user'];
      loggedinUser = User(
        userId: int.parse(foundUser['UserID']),
        username: foundUser['Username'],
        accountType: User.getAccountType(foundUser['Roles']),
      );

      //Save logged in user data to the device, so no need to login each time openning the app
      final localUserData = json.encode({
        "userId": loggedinUser.userId,
        "username": loggedinUser.username,
        "accountType": User.getAccountTypeString(loggedinUser.accountType),
      });
      final localStorage = await SharedPreferences.getInstance();
      localStorage.setString("userData", localUserData);
      notifyListeners();
    }
  }

  Future<void> autoLogin() async {
    try {
      final localStorage = await SharedPreferences.getInstance();
      if (!localStorage.containsKey("userData")) {
        return false;
      } else {
        final extractedData = json.decode(localStorage.getString("userData"));
        loggedinUser = User(
          userId: extractedData['userId'],
          username: extractedData['username'],
          accountType: User.getAccountType(extractedData['accountType']),
        );
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> signout() async {
    final localStorage = await SharedPreferences.getInstance();
    localStorage.clear();
    loggedinUser = null;
    notifyListeners();
  }
}
