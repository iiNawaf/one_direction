import 'package:flutter/foundation.dart';
import 'package:project/models/discounted_product_model.dart';

class DiscountedCollection {
  int offerId;
  List<DiscountedProduct> products;

  DiscountedCollection({
    @required this.offerId,
    @required this.products,
  });
}
