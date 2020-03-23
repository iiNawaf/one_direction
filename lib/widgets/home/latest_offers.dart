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
        width: 200.0,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.red,
                  child: Text(
                    discountedProduct.discount.toString().split(".")[1] == "0"
                        ? discountedProduct.discount.toString().split(".")[0] + "%"
                        : discountedProduct.discount.toString() + "%",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),
                  ),
                ),
                Text(
                  discountedProduct.endDate.difference(DateTime.now()).inDays < 1
                      ? "انتهى العرض"
                      : "ينتهي بعد ${discountedProduct.endDate.difference(DateTime.now()).inDays} يوم/أيام",
                  style: TextStyle(
                    color: discountedProduct.endDate.difference(DateTime.now()).inDays < 1 ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
            Expanded(flex: 3, child: Image.network(discountedProduct.productImageUrl)),
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
                Navigator.pushNamed(context, '/offerPreview', arguments: discountedProduct);
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
