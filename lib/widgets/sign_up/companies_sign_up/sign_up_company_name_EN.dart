import 'package:flutter/material.dart';


class SignUpCompanyNameEN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          icon: Icon(Icons.person, color: Colors.blue[200]),
          hintText: 'اسم الشركة بالإنجليزي',
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue[200]
              )
          )
      ),
    );
  }
}
