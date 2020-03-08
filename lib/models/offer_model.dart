import 'package:flutter/foundation.dart';

class Offer {
  final int offerId;
  final int companyId;
  double discount;
  int noProducts;
  String imageUrl;
  String keyword;
  DateTime startDate;
  DateTime endDate;

  Offer({
    @required this.discount,
    @required this.noProducts,
    @required this.companyId,
    @required this.endDate,
    @required this.imageUrl,
    @required this.keyword,
    @required this.offerId,
    @required this.startDate,
  });
}
