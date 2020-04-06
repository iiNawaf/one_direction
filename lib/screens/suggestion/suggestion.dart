import 'package:flutter/material.dart';
import 'package:project/widgets/suggestion/submit_suggestion.dart';
import 'package:project/widgets/suggestion/suggestion_email.dart';
import 'package:project/widgets/suggestion/suggestion_description.dart';
import 'package:project/widgets/suggestion/suggestion_subject.dart';

class SuggestionScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              SuggestionEmail(controller: emailController),
              Container(height: 20),
              SuggestionSubject(controller: titleController),
              Container(height: 30),
              SuggestionDescription(controller: descriptionController),
              Container(height: 35),
              SubmitSuggestion(
                formKey: formKey,
                emailController: emailController,
                titleController: titleController,
                descriptionController: descriptionController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
