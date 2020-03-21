import 'package:flutter/material.dart';

class EditOfferPercent extends StatelessWidget {
  final TextEditingController controller;

  EditOfferPercent({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
