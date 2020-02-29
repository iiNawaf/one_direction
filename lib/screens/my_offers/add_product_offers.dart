import 'package:flutter/material.dart';
import 'package:project/screens/my_offers/submit_product_offer.dart';
import 'package:project/widgets/my_offers/offers_percent.dart';
import 'package:project/widgets/my_offers/products_list.dart';


class AddProductOffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('اضافة عرض جديد'),
      ),
      body: Column(
        children: <Widget>[
          OffersPercent(),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              ProductsList(),
            ],
          )
        ],
      ),
      bottomNavigationBar: SubmitProductOffer(),
    );
  }
}
