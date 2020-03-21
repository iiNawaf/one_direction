import 'package:flutter/material.dart';

class ProductExpiry extends StatelessWidget {
  final String date;
  final Duration days;
  ProductExpiry({@required this.date, @required this.days});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          days.inDays < 1 ? "انتهى العرض" : 'ينتهي العرض يوم $date (باقي ${days.inDays} أيام)',
          style: TextStyle(fontWeight: FontWeight.bold, color: days.inDays < 1 ? Colors.red : Colors.grey),
        ),
      ],
    );
  }
}
