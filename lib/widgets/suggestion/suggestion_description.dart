import 'package:flutter/material.dart';

class SuggestionDescription extends StatelessWidget {
  final TextEditingController controller;

  SuggestionDescription({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return "هذا الحقل مطلوب";
        } else {
          return null;
        }
      },
      maxLines: 3,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: 'الوصف',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
