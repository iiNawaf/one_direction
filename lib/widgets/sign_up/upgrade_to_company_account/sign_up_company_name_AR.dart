import 'package:flutter/material.dart';

class SignUpCompanyNameAR extends StatelessWidget {
  final TextEditingController controller;

  SignUpCompanyNameAR({@required this.controller});

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
        hintText: 'اسم الشركة بالعربي',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
