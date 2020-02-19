import 'package:flutter/material.dart';


class ProductCity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.location_on, color: Colors.grey),
        Text('الطائف', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
