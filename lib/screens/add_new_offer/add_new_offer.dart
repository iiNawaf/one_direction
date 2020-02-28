import 'package:flutter/material.dart';
import 'package:project/widgets/add_new_offer/add_offer_keywords.dart';
import 'package:project/widgets/add_new_offer/add_offer_percent.dart';
import 'package:project/widgets/add_new_offer/add_offer_percent_image.dart';
import 'package:project/widgets/add_new_product/add_product_category.dart';
import 'package:project/widgets/add_new_offer/add_product_expire_date.dart';
import 'package:project/widgets/add_new_offer/add_product_inital_date.dart';
import 'package:project/widgets/add_new_product/add_product_link.dart';
import 'package:project/widgets/add_new_product/add_product_name.dart';
import 'package:project/widgets/add_new_product/add_product_price.dart';
import 'package:project/widgets/add_new_product/submit_product.dart';

class AddNewOfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: 10),
          Center(
            child: Text('إضافة عرض جديد', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              child: Column(
                  children: <Widget>[
                    AddOfferPercent(),
                    Container(height: 20),
                    AddOfferPercentImage(),
                    Container(height: 20),
                    AddOfferKeywords(),
                    Container(height: 20),
                    Text('من'),
                    AddProductInitialDate(),
                    Container(height: 5),
                    Text('إلى'),
                    AddProductExpireDate(),
                    Container(height: 30),
                    SubmitProduct(),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
