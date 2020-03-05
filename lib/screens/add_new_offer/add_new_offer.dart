import 'package:flutter/material.dart';
import 'package:project/widgets/add_new_offer/add_offer_keywords.dart';
import 'package:project/widgets/add_new_offer/add_offer_percent.dart';
import 'package:project/widgets/add_new_offer/add_offer_percent_image.dart';
import 'package:project/widgets/add_new_offer/add_product_expire_date.dart';
import 'package:project/widgets/add_new_offer/add_product_inital_date.dart';
import 'package:project/widgets/add_new_offer/submit_offer.dart';

class AddNewOfferScreen extends StatefulWidget {
  @override
  _AddNewOfferScreenState createState() => _AddNewOfferScreenState();
}

class _AddNewOfferScreenState extends State<AddNewOfferScreen> {
  final TextEditingController discountController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController keywordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    discountController.clear();
    imageUrlController.clear();
    keywordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
              key: formKey,
              child: Column(children: <Widget>[
                AddOfferPercent(controller: discountController),
                Container(height: 20),
                AddOfferPercentImage(controller: imageUrlController),
                Container(height: 20),
                AddOfferKeywords(controller: keywordController),
                Container(height: 20),
                Text('من'),
                AddProductInitialDate(),
                Container(height: 5),
                Text('إلى'),
                AddProductExpireDate(),
                Container(height: 30),
                SubmitOffer(
                  formKey: formKey,
                  scaffoldKey: scaffoldKey,
                  discountController: discountController,
                  imageUrlController: imageUrlController,
                  keywordController: keywordController,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
