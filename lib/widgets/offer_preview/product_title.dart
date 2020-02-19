import 'package:flutter/material.dart';


class ProductTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('حذاء اديداس جديد اللون اسود مقاس 42', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
