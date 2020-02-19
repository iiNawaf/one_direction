import 'package:flutter/material.dart';


class ProductOwner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.local_offer, color: Colors.grey),
        Text('Company name', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
