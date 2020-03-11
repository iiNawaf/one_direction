import 'package:flutter/material.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/offers_list.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/products_list.dart';



class ManageProductAndOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('ادارة'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text('منتجاتي',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              ProductsList()
            ],
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text('عروضي',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              OffersList()
            ],
          ),
        ],
      ),
    );
  }
}
