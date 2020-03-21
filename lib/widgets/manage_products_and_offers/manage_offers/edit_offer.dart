import 'package:flutter/material.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/edit_offer_expire_date.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/edit_offer_initial_date.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/edit_offer_keywords.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/edit_offer_percent.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/edit_offer_percent_image.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/submit_edit_offer.dart';

class EditOffer extends StatelessWidget {
  final TextEditingController percentController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController keywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chosenOffer = ModalRoute.of(context).settings.arguments as Offer;
    percentController.text = chosenOffer.discount.toString();
    imageController.text = chosenOffer.imageUrl;
    keywordController.text = chosenOffer.keyword;
    EditOfferInitalDate.startDate = chosenOffer.startDate;
    EditOfferExpireDate.endDate = chosenOffer.endDate;

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
                  EditOfferPercent(controller: percentController),
                  Container(height: 20),
                  EditOfferPercentImage(controller: imageController),
                  Container(height: 20),
                  EditOfferKeywords(controller: keywordController),
                  Container(height: 20),
                  Text('من'),
                  EditOfferInitalDate(),
                  Container(height: 20),
                  Text('إلى'),
                  EditOfferExpireDate(),
                  Container(height: 30),
                  SubmitEditOffer(
                    chosenOffer: chosenOffer,
                    percentController: percentController,
                    imageController: imageController,
                    keywordController: keywordController,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
