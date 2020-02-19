import 'package:flutter/material.dart';


class ProductExpiry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('ينتهي العرض يوم ' + 'date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
      ],
    );
  }
}
