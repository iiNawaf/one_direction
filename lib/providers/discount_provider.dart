import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const _domain = "https://one-direction-app.000webhostapp.com/index.php/discount/";

class DiscountProvider extends ChangeNotifier {
  Future<void> applyOffer(int offerId, List<int> productsList) async {
    const url = _domain + "apply";
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "offerId": offerId,
        "productsList": json.encode(productsList),
      }),
    );
    final extracterdResponse = json.decode(response.body);
    if (extracterdResponse['error'] != null) {
      throw Exception(extracterdResponse['error']);
    }
  }
}
