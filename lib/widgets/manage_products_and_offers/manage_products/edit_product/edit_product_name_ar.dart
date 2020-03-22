import 'package:flutter/material.dart';

class EditProductNameAr extends StatelessWidget {
  final TextEditingController controller;

  EditProductNameAr({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        icon: Icon(Icons.local_offer, color: Colors.blue[200]),
        hintText: 'اسم المنتج بالعربي',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
