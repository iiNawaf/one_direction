import 'package:flutter/foundation.dart';

class DiscountedProduct {
  final int productId;
  final int offerId;
  final int companyId;
  final String companyName;
  final String productName;
  final String productImageUrl;
  final String offerImageUrl;
  final double discount;
  final double priceBefore;
  final double priceAfter;
  final String category;
  final DateTime startDate;
  final DateTime endDate;

  DiscountedProduct({
    @required this.productName,
    @required this.category,
    @required this.companyId,
    @required this.discount,
    @required this.offerId,
    @required this.productId,
    @required this.priceAfter,
    @required this.priceBefore,
    @required this.companyName,
    @required this.offerImageUrl,
    @required this.productImageUrl,
    @required this.startDate,
    @required this.endDate,
  });
}
