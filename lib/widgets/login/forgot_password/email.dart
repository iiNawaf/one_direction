import 'package:flutter/material.dart';


class Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return "هذا الحقل مطلوب";
          } else {
            return null;
          }
        },
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          icon: Icon(Icons.email, color: Colors.blue[200]),
          hintText: 'البريد الالكتروني',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue[200]),
          ),
        ),
      ),
    );
  }
}
