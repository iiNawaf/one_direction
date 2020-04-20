import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/models/suggestions_model.dart';

const _domain = "https://one-direction-app.000webhostapp.com/index.php/suggestions/";

class SuggestionsProvider extends ChangeNotifier {
  List<Suggestion> suggestionsList = [];

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

  Future<void> load() async {
    const url = _domain + "load";
    final response = await http.get(
      url,
      headers: {"Content-type": "application/json"},
    );
    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception("${extractedResponse['error']}: ${extractedResponse['details']}");
    } else {
      final suggestions = extractedResponse['suggestions'] as List<dynamic>;
      suggestions.forEach((element) {
        final newSuggestion = Suggestion(
          id: int.parse(element['id']),
          email: element['email'],
          title: element['title'],
          description: element['description'],
        );
        suggestionsList.add(newSuggestion);
        notifyListeners();
      });
    }
  }
}
