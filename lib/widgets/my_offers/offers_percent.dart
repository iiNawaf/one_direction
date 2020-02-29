import 'package:flutter/material.dart';


class OffersPercent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        maxLength: 3,
        keyboardType: TextInputType.number,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            counterText: '',
            hintText: 'نسبة الخصم',
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.blue[200]
                )
            )
        ),
      ),
    );
  }
}
