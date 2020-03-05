import 'package:flutter/foundation.dart';

class Offer {
  final int offerId;
  double discount;
  String imageUrl;
  String keyword;
  DateTime startDate;
  DateTime endDate;

  Offer({
    @required this.discount,
    @required this.endDate,
    @required this.imageUrl,
    @required this.keyword,
    @required this.offerId,
    @required this.startDate,
  });
}
