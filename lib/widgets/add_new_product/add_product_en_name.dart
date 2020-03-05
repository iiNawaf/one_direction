import 'package:flutter/material.dart';

class AddProductEnName extends StatelessWidget {
  final TextEditingController controller;

  AddProductEnName({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value.isEmpty) {
          return "هذا الحقل مطلوب";
        } else {
          return null;
        }
      },
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
