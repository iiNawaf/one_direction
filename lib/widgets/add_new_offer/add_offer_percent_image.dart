import 'package:flutter/material.dart';

class AddOfferPercentImage extends StatelessWidget {
  final TextEditingController controller;

  AddOfferPercentImage({@required this.controller});

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
        icon: Icon(Icons.link, color: Colors.blue[200]),
        hintText: 'رابط صورة العرض',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
