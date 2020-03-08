import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:project/models/offer_model.dart';
import 'package:http/http.dart' as http;

const _domain = "https://one-direction-app.000webhostapp.com/index.php/offers/";

class OffersProvider extends ChangeNotifier {
  List<Offer> companyOffers = [];

  Future<void> insert(Offer offer) async {
    const url = _domain + "insert";
    final response = await http.post(
      url,
      body: json.encode({
        "companyId": offer.companyId,
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

  Future<void> loadOffers(int companyId) async {
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
    } else if (extractedResponse['offers'] != null) {
      final loadedOffers = extractedResponse['offers'] as List<dynamic>;
      loadedOffers.forEach((element) {
        final newOffer = Offer(
          offerId: int.parse(element['Offercode']),
          companyId: int.parse(element['Companyid']),
          discount: double.parse(element['discount']),
          noProducts: element['No_of_products'] == null ? 0 : int.parse(element['No_of_products']),
          startDate: DateTime.parse(element['StartDate']),
          endDate: DateTime.parse(element['endDate']),
          imageUrl: element['OfferImages'],
          keyword: element['Keywords'],
        );
        companyOffers.add(newOffer);
      });
      notifyListeners();
    }
  }
}