import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  final TextEditingController controller;

  Email({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
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
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
