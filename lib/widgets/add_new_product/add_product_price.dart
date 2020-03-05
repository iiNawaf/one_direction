import 'package:flutter/material.dart';

class AddProductPrice extends StatelessWidget {
  final TextEditingController controller;

  AddProductPrice({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        try {
          double.parse(value);
          if (value.isEmpty) {
            return "هذا الحقل مطلوب";
          } else {
            return null;
          }
        } catch (e) {
          return "الرجاء ادخال قيمة صحيحة";
        }
      },
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
