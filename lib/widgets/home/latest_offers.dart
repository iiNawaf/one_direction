import 'package:flutter/material.dart';
import 'package:project/models/discounted_product_model.dart';

class LatestOffers extends StatelessWidget {
  final DiscountedProduct discountedProduct;

  LatestOffers({@required this.discountedProduct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        width: 150.0,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  discountedProduct.discount.toString().split(".")[1] == "0"
                      ? discountedProduct.discount.toString().split(".")[0] + "%"
                      : discountedProduct.discount.toString() + "%",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "ينتهي بعد ${discountedProduct.endDate.difference(discountedProduct.startDate).inDays} يوم/أيام",
                  style: TextStyle(
                    color: Colors.yellow[900],
                  ),
                ),
              ],
            ),
            Expanded(flex: 3, child: Image.network(discountedProduct.productImageUrl, height: 50.0)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(discountedProduct.productName, style: TextStyle(fontSize: 12)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(discountedProduct.priceBefore.toString() + 'ر.س.', style: TextStyle(decoration: TextDecoration.lineThrough)),
                  Text(discountedProduct.priceAfter.toString() + 'ر.س.', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/offerPreview');
              },
              child: Container(
                height: 30.0,
                color: Colors.blue[200],
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.local_offer, size: 18),
                    Text(' الذهاب إلى العرض', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
