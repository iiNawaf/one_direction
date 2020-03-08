import 'package:flutter/foundation.dart';

class Product {
  final int productId;
  final int companyId;
  String arName;
  String enName;
  String imageUrl;
  double price;
  String category;

  Product({
    @required this.companyId,
    @required this.imageUrl,
    @required this.arName,
    @required this.category,
    @required this.enName,
    @required this.price,
    @required this.productId,
  });
}
