import 'package:flutter/material.dart';


class NewPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
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
          hintText: 'كلمة المرور الجديدة',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue[200]),
          ),
        ),
      ),
    );
  }
}
