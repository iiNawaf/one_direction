import 'package:flutter/material.dart';


class SignUpConfirmPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.lock, color: Colors.blue[200]),
          hintText: 'تأكيد كلمة المرور',
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue[200]
              )
          )
      ),
    );
  }
}
