import 'package:flutter/material.dart';

class AddOfferPercent extends StatelessWidget {
  final TextEditingController controller;

  AddOfferPercent({@required this.controller});

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
      maxLength: 3,
      keyboardType: TextInputType.number,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        icon: Icon(Icons.exposure_zero, color: Colors.blue[200]),
        counterText: '',
        hintText: 'نسبة الخصم',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
