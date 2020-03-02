import 'package:flutter/material.dart';

class SignUpCompanyNameEN extends StatelessWidget {
  final TextEditingController controller;

  SignUpCompanyNameEN({@required this.controller});

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
        icon: Icon(Icons.person, color: Colors.blue[200]),
        hintText: 'اسم الشركة بالإنجليزي',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
