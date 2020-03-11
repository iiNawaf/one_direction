import 'package:flutter/material.dart';


class EditOfferPercentImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
