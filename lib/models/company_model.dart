import 'package:flutter/foundation.dart';

class Company {
  final int companyId;
  final String arName;
  final String enName;
  final String email;
  final String logoUrl;
  final String url;
  final String phone;
  final String category;

  Company({
    @required this.companyId,
    @required this.arName,
    @required this.enName,
    @required this.email,
    @required this.logoUrl,
    @required this.url,
    @required this.phone,
    @required this.category,
  });
}
