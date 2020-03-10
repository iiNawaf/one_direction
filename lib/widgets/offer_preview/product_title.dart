import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final String title;
  ProductTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
