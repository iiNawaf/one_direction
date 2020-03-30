import 'package:flutter/material.dart';

class CurrentPassword extends StatelessWidget {
  final TextEditingController controller;

  CurrentPassword({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        validator: (value) {
          if (value.isEmpty) {
            return "هذا الحقل مطلوب";
          } else {
            return null;
          }
        },
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          icon: Icon(Icons.lock, color: Colors.blue[200]),
          hintText: 'كلمة المرور الحالية',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue[200]),
          ),
        ),
      ),
    );
  }
}
