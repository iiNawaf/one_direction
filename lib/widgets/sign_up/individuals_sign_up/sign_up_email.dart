import 'package:flutter/material.dart';


class SignUpEmail extends StatelessWidget {
  final TextEditingController controller;
  SignUpEmail({@required this.controller});

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
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        icon: Icon(Icons.email, color: Colors.blue[200]),
        hintText: 'البريد الإلكتروني',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
