import 'package:flutter/material.dart';


class SignUpCompanyWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          icon: Icon(Icons.web, color: Colors.blue[200]),
          hintText: 'موقع الشركة',
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue[200]
              )
          )
      ),
    );
  }
}
