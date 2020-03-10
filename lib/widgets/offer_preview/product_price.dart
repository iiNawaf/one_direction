import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final double price;
  final bool isBefore;
  ProductPrice({@required this.price, @required this.isBefore});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.monetization_on, color: Colors.grey),
        Text(
          '$price' + 'ر.س.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: isBefore ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
