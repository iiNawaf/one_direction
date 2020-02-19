import 'package:flutter/material.dart';


class ProductPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.monetization_on, color: Colors.grey),
        Text('150' + 'ر.س.', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
