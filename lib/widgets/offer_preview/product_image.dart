import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  ProductImage({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: EdgeInsets.all(20),
      child: Image.network(imageUrl, fit: BoxFit.fill),
    );
  }
}
