import 'package:flutter/material.dart';


class EditProductNameEN extends StatelessWidget {
  final TextEditingController controller;

  EditProductNameEN({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
