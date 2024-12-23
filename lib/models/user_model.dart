import 'package:flutter/cupertino.dart';

enum AccountType {
  Individual,
  Company,
  Admin,
}

class User {
  final int userId;
  final String username;
  final AccountType accountType;

  User({
    @required this.userId,
    @required this.username,
    @required this.accountType,
  });

  static AccountType getAccountType(String typeInString) {
    if (typeInString == "individual") {
      return AccountType.Individual;
    } else if (typeInString == "company") {
      return AccountType.Company;
    } else if (typeInString == "admin") {
      return AccountType.Admin;
    } else {
      return null;
    }
  }

  static String getAccountTypeString(AccountType accountType) {
    if (accountType == AccountType.Individual) {
      return "individual";
    } else if (accountType == AccountType.Company) {
      return "company";
    } else if (accountType == AccountType.Admin) {
      return "admin";
    } else {
      return null;
    }
  }
}
