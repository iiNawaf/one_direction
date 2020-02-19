import 'package:flutter/material.dart';


class SignUpCompanyConfirmPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      obscureText: true,
      decoration: InputDecoration(
          icon: Icon(Icons.person, color: Colors.blue[200]),
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
