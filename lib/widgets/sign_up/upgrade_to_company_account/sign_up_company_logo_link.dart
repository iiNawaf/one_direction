import 'package:flutter/material.dart';


class SignUpCompanyLogoLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          icon: Icon(Icons.link, color: Colors.blue[200]),
          hintText: 'رابط شعار الشركة',
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue[200]
              )
          )
      ),
    );
  }
}
