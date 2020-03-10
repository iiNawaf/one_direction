import 'package:flutter/material.dart';

class ProductOwner extends StatelessWidget {
  final String companyName;
  ProductOwner({@required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.local_offer, color: Colors.grey),
        Text(companyName, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
