import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:project/models/product_model.dart';
import 'package:http/http.dart' as http;

const _domain = "https://one-direction-app.000webhostapp.com/index.php/products/";

class ProductsProvider extends ChangeNotifier {
  List<Product> companyProducts = [];

  Future<void> insert(Product product) async {
    const url = _domain + "insert";
    final response = await http.post(
      url,
      body: json.encode({
        "companyId": product.companyId,
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

  Future<void> loadProducts(int companyId) async {
    const url = _domain + "load";
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "companyId": companyId,
      }),
    );
    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception(extractedResponse['error']);
    } else {
      if (extractedResponse['products'] != null) {
        final loadedProducts = extractedResponse['products'] as List<dynamic>;
        companyProducts.clear();
        loadedProducts.forEach((element) {
          final newProduct = Product(
            productId: int.parse(element['Product_code']),
            companyId: int.parse(element['Companyid']),
            arName: element['Pname_ar'],
            enName: element['Pname_en'],
            price: double.parse(element['price']),
            imageUrl: element['Prod_image'],
            category: element['Category'],
          );
          companyProducts.add(newProduct);
        });
        notifyListeners();
      }
    }
  }
}
