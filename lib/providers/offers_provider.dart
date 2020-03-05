import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:project/models/offer_model.dart';
import 'package:http/http.dart' as http;

const _domain = "https://one-direction-app.000webhostapp.com/index.php/offers/";

class OffersProvider extends ChangeNotifier {
  List<Offer> companyOffers = [];

  Future<void> insert(int companyId, Offer offer) async {
    const url = _domain + "insert";
    final response = await http.post(
      url,
      body: json.encode({
        "companyId": companyId,
        "discount": offer.discount,
        "imageUrl": offer.imageUrl,
        "keyword": offer.keyword,
        "startDate": offer.startDate.toIso8601String(),
        "endDate": offer.endDate.toIso8601String(),
      }),
      headers: {"Content-Type": "application/json"},
    );
    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception(extractedResponse['error']);
    }
  }
}
