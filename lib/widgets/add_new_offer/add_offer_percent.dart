import 'package:flutter/material.dart';


class AddOfferPercent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 3,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          icon: Icon(Icons.exposure_zero, color: Colors.blue[200]),
          counterText: '',
          hintText: 'نسبة الخصم',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue[200]
              )
          )
      ),
    );
  }
}
