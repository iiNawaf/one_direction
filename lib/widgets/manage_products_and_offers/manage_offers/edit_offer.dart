import 'package:flutter/material.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/edit_offer_expire_date.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/edit_offer_initial_date.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/edit_offer_keywords.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/edit_offer_percent.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/edit_offer_percent_image.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/submit_edit_offer.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/edit_product/submit_edit_product.dart';


class EditOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('تعديل العرض'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              child: Column(
                children: <Widget>[
                  EditOfferPercent(),
                  Container(height: 20),
                  EditOfferPercentImage(),
                  Container(height: 20),
                  EditOfferKeywords(),
                  Container(height: 20),
                  Text('من'),
                  EditOfferInitalDate(),
                  Container(height: 20),
                  Text('إلى'),
                  EditOfferExpireDate(),
                  Container(height: 30),
                  SubmitEditOffer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
