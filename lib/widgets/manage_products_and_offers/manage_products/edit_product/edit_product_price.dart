import 'package:flutter/material.dart';


class EditProductPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        icon: Icon(Icons.attach_money, color: Colors.blue[200]),
        hintText: 'السعر',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
