import 'package:flutter/material.dart';


class EditProductNameEN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        icon: Icon(Icons.local_offer, color: Colors.blue[200]),
        hintText: 'اسم المنتج بالانجليزي',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}