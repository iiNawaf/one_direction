import 'package:flutter/material.dart';


class ProductImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(20),
      child: Image.asset('./assets/shoes.jpeg'),
    );
  }
}
