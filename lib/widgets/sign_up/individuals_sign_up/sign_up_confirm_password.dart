import 'package:flutter/material.dart';

class SignUpConfirmPassword extends StatelessWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;
  SignUpConfirmPassword({@required this.controller, @required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value != passwordController.text) {
          return "كلمات المرور غير متطابقة";
        } else {
          return null;
        }
      },
      cursorColor: Colors.grey,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock, color: Colors.blue[200]),
        hintText: 'تأكيد كلمة المرور',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
