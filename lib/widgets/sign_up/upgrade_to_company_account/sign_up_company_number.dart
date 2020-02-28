import 'package:flutter/material.dart';


class SignUpCompanyNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          icon: Icon(Icons.phone, color: Colors.blue[200]),
          hintText: 'رقم الهاتف',
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue[200]
              )
          )
      ),
    );
  }
}
