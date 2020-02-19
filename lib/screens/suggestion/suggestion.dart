import 'package:flutter/material.dart';
import 'package:project/widgets/suggestion/submit_suggestion.dart';
import 'package:project/widgets/suggestion/suggestion_email.dart';
import 'package:project/widgets/suggestion/suggestion_description.dart';
import 'package:project/widgets/suggestion/suggestion_subject.dart';


class SuggestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('ارسال اقتراح'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            SuggestionEmail(),
            Container(height: 20),
            SuggestionSubject(),
            Container(height: 30),
            SuggestionDescription(),
            Container(height: 35),
            SubmitSuggestion()
          ],
        ),
      ),
    );
  }
}
