import 'package:flutter/material.dart';

class LoginPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.lock, color: Colors.blue[200]),
          hintText: 'كلمة المرور',
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue[200]
              )
          )
      ),
    );
  }
}
