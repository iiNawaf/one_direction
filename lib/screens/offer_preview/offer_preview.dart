import 'package:flutter/material.dart';
import 'package:project/widgets/offer_preview/open_product_link.dart';
import 'package:project/widgets/offer_preview/product_city.dart';
import 'package:project/widgets/offer_preview/product_expiry.dart';
import 'package:project/widgets/offer_preview/product_image.dart';
import 'package:project/widgets/offer_preview/product_owner.dart';
import 'package:project/widgets/offer_preview/product_price.dart';
import 'package:project/widgets/offer_preview/product_title.dart';

class OfferPreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
      ),
      body: ListView(
        children: <Widget>[
          ProductImage(),
          Divider(color: Colors.grey),
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                ProductTitle(),
                ProductOwner(),
                ProductCity(),
                ProductPrice(),
                SizedBox(height: 10),
                ProductExpiry(),
                SizedBox(height: 25),
                OpenProductLink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
