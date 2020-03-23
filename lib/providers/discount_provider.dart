import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:project/models/discounted_collection_model.dart';
import 'package:project/models/discounted_product_model.dart';

const _domain = "https://one-direction-app.000webhostapp.com/index.php/discount/";

class DiscountProvider extends ChangeNotifier {
  List<DiscountedProduct> discountedProductsList = [];
  List<DiscountedProduct> currentCompanyDiscountedProducts = [];
  List<DiscountedCollection> companyDiscountedCollection = [];
  bool isLoading = false;

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

  Future<void> loadDiscountedOffers() async {
    const url = _domain + "load";
    isLoading = true;
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      isLoading = false;
      throw Exception("${extractedResponse['error']}: ${extractedResponse['details']}");
    } else {
      final loadedDiscountedProduct = extractedResponse['discountedProducts'] as List<dynamic>;
      discountedProductsList.clear();
      loadedDiscountedProduct.forEach((element) {
        final newDiscountProduct = DiscountedProduct(
          companyId: int.parse(element['Companyid']),
          productId: int.parse(element['Product_code']),
          offerId: int.parse(element['Offercode']),
          companyName: "${element['Name_ar']} - ${element['Name_en']}",
          category: element['Category'],
          productName: "${element['Pname_ar']} - ${element['Pname_en']}",
          productImageUrl: element['Prod_image'],
          offerImageUrl: element['Offerimages'],
          discount: double.parse(element['discount']),
          priceAfter: double.parse(double.parse(element['price_after']).toStringAsFixed(2)),
          priceBefore: double.parse(double.parse(element['price_before']).toStringAsFixed(2)),
          startDate: DateTime.parse(element['StartDate']),
          endDate: DateTime.parse(element['endDate']),
        );
        discountedProductsList.add(newDiscountProduct);
      });
      isLoading = false;
      notifyListeners();
    }
  }

  void loadCurrentCompanyDiscountedProducts(int companyId) {
    currentCompanyDiscountedProducts.clear();
    discountedProductsList.forEach((element) {
      if (element.companyId == companyId) {
        currentCompanyDiscountedProducts.add(element);
      }
    });
    fillDiscountCollection();
  }

  void fillDiscountCollection() {
    companyDiscountedCollection.clear();
    List<int> offersIds = [];
    List<DiscountedCollection> discountedCollection = [];
    //save each offer id
    currentCompanyDiscountedProducts.forEach((element) {
      if (!offersIds.contains(element.offerId)) {
        offersIds.add(element.offerId);
      }
    });
    //fill collection with offers ids
    offersIds.forEach((element) => discountedCollection.add(DiscountedCollection(offerId: element, products: [])));
    //fill each collection products with discounted product with same offer id
    discountedCollection.forEach(
      (collectionItem) => currentCompanyDiscountedProducts.forEach((companyItem) {
        if (companyItem.offerId == collectionItem.offerId) {
          collectionItem.products.add(companyItem);
        }
      }),
    );
    //fill global list with collection list
    discountedCollection.forEach((element) => companyDiscountedCollection.add(element));
  }

  Future<void> deleteDiscountedProducts(int offerId) async {
    const url = _domain + "delete";
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "offerId": offerId,
      }),
    );
    final extractedResponse = json.decode(response.body);
    if (extractedResponse['error'] != null) {
      throw Exception("${extractedResponse['error']} | ${extractedResponse['details']}");
    }
  }

  void removeDiscountedProductByOfferId(int offerId) {
    discountedProductsList.removeWhere((element) => element.offerId == offerId);
    notifyListeners();
  }

  void removeDiscountedProductByProductId(int productId) {
    discountedProductsList.removeWhere((element) => element.productId == productId);
    notifyListeners();
  }

  List<DiscountedProduct> getCategoryProducts(String category) {
    return discountedProductsList.where((element) => element.category == category).toList();
  }
}
