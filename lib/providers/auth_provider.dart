import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:project/models/company_model.dart';
import 'package:project/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const _domain = "https://one-direction-app.000webhostapp.com/index.php/auth/";

class AuthProvider extends ChangeNotifier {
  User loggedinUser;
  Company userComapny;

  //** SIGNUP **/
  Future<void> signup(String username, String email, String password) async {
    final url = _domain + "signup";
    final response = await http.post(
      url,
      body: json.encode({
        "username": username,
        "email": email,
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

  //** LOGIN **/
  Future<void> login(String username, String password) async {
    final url = _domain + "login";
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

      if (loggedinUser.accountType != AccountType.Admin) {
        if (foundUser['Roles'] == "company") {
          final foundCompany = extractedResponse['company'];
          userComapny = Company(
            companyId: int.parse(foundCompany['Companyid']),
            arName: foundCompany['Name_ar'],
            enName: foundCompany['Name_er'],
            email: foundCompany['Email'],
            logoUrl: foundCompany['Logo'],
            url: foundCompany['url'],
            phone: foundCompany['PhoneNo'],
            category: foundCompany['Category'],
          );
        }
        //Save logged in user data to the device, so no need to login each time openning the app
        if (userComapny == null) {
          final localUserData = json.encode({
            "userId": loggedinUser.userId,
            "username": loggedinUser.username,
            "accountType": User.getAccountTypeString(loggedinUser.accountType),
          });
          final localStorage = await SharedPreferences.getInstance();
          localStorage.setString("userData", localUserData);
        } else {
          final localUserData = json.encode({
            "userId": loggedinUser.userId,
            "username": loggedinUser.username,
            "accountType": User.getAccountTypeString(loggedinUser.accountType),
            "conpanyId": userComapny.companyId,
            "arName": userComapny.arName,
            "enName": userComapny.enName,
            "email": userComapny.email,
            "logoUrl": userComapny.logoUrl,
            "url": userComapny.url,
            "phone": userComapny.phone,
            "category": userComapny.category,
          });
          final localStorage = await SharedPreferences.getInstance();
          localStorage.setString("userDataWithCompany", localUserData);
        }
      }
    }
  }

  //** AUTO LOGIN **/
  Future<void> autoLogin() async {
    try {
      final localStorage = await SharedPreferences.getInstance();
      if (localStorage.containsKey("userData")) {
        final extractedData = json.decode(localStorage.getString("userData"));
        loggedinUser = User(
          userId: extractedData['userId'],
          username: extractedData['username'],
          accountType: User.getAccountType(extractedData['accountType']),
        );
        return true;
      } else if (localStorage.containsKey("userDataWithCompany")) {
        final extractedData = json.decode(localStorage.getString("userDataWithCompany"));
        loggedinUser = User(
          userId: extractedData['userId'],
          username: extractedData['username'],
          accountType: User.getAccountType(extractedData['accountType']),
        );
        userComapny = Company(
          companyId: extractedData['conpanyId'],
          arName: extractedData['arName'],
          enName: extractedData['enName'],
          email: extractedData['email'],
          logoUrl: extractedData['logoUrl'],
          url: extractedData['url'],
          phone: extractedData['phone'],
          category: extractedData['category'],
        );
        await getUserRating(loggedinUser.userId);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //** SIGNOUT **/
  Future<void> signout() async {
    final localStorage = await SharedPreferences.getInstance();
    localStorage.clear();
    loggedinUser = null;
    userComapny = null;
  }

  Future<void> upgradeToCompany(int accountId, Company companyInfo) async {
    final url = _domain + "upgrade";
    final response = await http.post(
      url,
      body: json.encode({
        "accountId": accountId,
        "arName": companyInfo.arName,
        "enName": companyInfo.enName,
        "email": companyInfo.email,
        "logoUrl": companyInfo.logoUrl,
        "url": companyInfo.url,
        "phone": companyInfo.phone,
        "category": companyInfo.category,
      }),
      headers: {"Content-Type": "application/json"},
    );

    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception(extractedResponse['error']);
    }
  }

  //** PASSWORD RECOVER **/
  Future<String> passwordRecover(String email) async {
    const url = _domain + "forget_password_recover";
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({"email": email}),
    );
    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception("${extractedResponse['error']}: ${extractedResponse['details']}");
    } else {
      return extractedResponse['new_password'];
    }
  }

  Future<void> setPassword(int userId, String oldPassword, String newPassword) async {
    const url = _domain + "set_password";
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "userId": userId,
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      }),
    );
    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception("${extractedResponse['error']}: ${extractedResponse['details']}");
    }
  }

  // --------------- RATING PROCESSES ------------------//
  int userRating = 0;
  Future<void> getUserRating(int userId) async {
    const url = "https://one-direction-app.000webhostapp.com/index.php/rating/get-user-rating";
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({"userId": userId}),
    );
    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception("${extractedResponse['error']}: ${extractedResponse['details']}");
    } else {
      final serverUserRating = int.parse(extractedResponse['user_rating']);
      userRating = serverUserRating;
    }
  }

  Future<void> setUserRating(int userId, int rating) async {
    const url = "https://one-direction-app.000webhostapp.com/index.php/rating/set-user-rating";
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "userId": userId,
        "userRating": rating,
      }),
    );
    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception("${extractedResponse['error']}: ${extractedResponse['details']}");
    } else {
      userRating = rating;
    }
  }
}
