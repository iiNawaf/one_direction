import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const _domain = "https://one-direction-app.000webhostapp.com/index.php/suggestions/";

class SuggestionsProvider extends ChangeNotifier {
  Future<void> addNewSuggestion(String email, String title, String description) async {
    const url = _domain + "add";
    final response = await http.post(
      url,
      headers: {"Content-type": "application/json"},
      body: json.encode({
        "email": email,
        "title": title,
        "description": description,
      }),
    );
    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception("${extractedResponse['error']}: ${extractedResponse['details']}");
    }
  }
}
