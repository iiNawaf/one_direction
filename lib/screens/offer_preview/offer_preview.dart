import 'package:flutter/material.dart';
import 'package:project/models/discounted_product_model.dart';
import 'package:project/widgets/offer_preview/product_expiry.dart';
import 'package:project/widgets/offer_preview/product_image.dart';
import 'package:project/widgets/offer_preview/product_owner.dart';
import 'package:project/widgets/offer_preview/product_price.dart';
import 'package:project/widgets/offer_preview/product_title.dart';

class OfferPreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as DiscountedProduct;
    final days = product.endDate.difference(product.startDate);

    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
      ),
      body: ListView(
        children: <Widget>[
          ProductImage(imageUrl: product.productImageUrl),
          Divider(color: Colors.grey),
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                ProductTitle(title: product.productName),
                ProductOwner(companyName: product.companyName),
                ProductPrice(price: product.priceBefore, isBefore: true),
                ProductPrice(price: product.priceAfter, isBefore: false),
                SizedBox(height: 10),
                ProductExpiry(date: product.endDate.toString().split(" ")[0], days: days),
                SizedBox(height: 25),
                //ProductCity(),
                //OpenProductLink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
