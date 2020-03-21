import 'package:flutter/material.dart';


class EditOfferPercentImage extends StatelessWidget {
  final TextEditingController controller;

  EditOfferPercentImage({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
