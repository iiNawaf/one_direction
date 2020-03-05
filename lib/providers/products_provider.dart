import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:project/models/product_model.dart';
import 'package:http/http.dart' as http;

const _domain = "https://one-direction-app.000webhostapp.com/index.php/products/";

class ProductsProvider extends ChangeNotifier {
  List<Product> companyProducts = [];

  Future<void> insert(int comapanyId, Product product) async {
    const url = _domain + "insert";
    final response = await http.post(
      url,
      body: json.encode({
        "companyId": comapanyId,
        "arName": product.arName,
        "enName": product.enName,
        "price": product.price,
        "imageUrl": product.imageUrl,
        "category": product.category,
      }),
      headers: {"Content-Type": "application/json"},
    );
    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception(extractedResponse['error']);
    }
  }
}
