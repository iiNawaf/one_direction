import 'package:flutter/material.dart';

class SignUpCompanyNumber extends StatelessWidget {
  final TextEditingController controller;

  SignUpCompanyNumber({@required this.controller});

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
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        icon: Icon(Icons.phone, color: Colors.blue[200]),
        hintText: 'رقم الهاتف',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
