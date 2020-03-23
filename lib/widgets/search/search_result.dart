import 'package:flutter/material.dart';
import 'package:project/models/discounted_product_model.dart';

class SearchResult extends StatelessWidget {
  final DiscountedProduct searchItem;
  SearchResult({this.searchItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
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
                    searchItem.discount.toString().split(".")[1] == "0"
                        ? searchItem.discount.toString().split(".")[0] + "%"
                        : searchItem.discount.toString() + "%",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),
                  ),
                ),
                Text(
                  searchItem.endDate.isBefore(DateTime.now())
                      ? "انتهى العرض"
                      : "ينتهي بعد ${searchItem.endDate.difference(searchItem.startDate).inDays} يوم/أيام",
                  style: TextStyle(
                    color: searchItem.endDate.isBefore(DateTime.now()) ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
            Expanded(flex: 3, child: Image.network(searchItem.productImageUrl, height: 50.0)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(searchItem.productName, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${searchItem.priceBefore}" + 'ر.س.', style: TextStyle(decoration: TextDecoration.lineThrough)),
                  Text("${searchItem.priceAfter}" + 'ر.س.', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/offerPreview', arguments: searchItem);
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
