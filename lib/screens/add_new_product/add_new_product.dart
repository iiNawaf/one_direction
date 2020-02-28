import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:project/widgets/add_new_product/add_product_category.dart';
import 'package:project/widgets/add_new_offer/add_product_expire_date.dart';
import 'package:project/widgets/add_new_offer/add_product_inital_date.dart';
import 'package:project/widgets/add_new_product/add_product_link.dart';
import 'package:project/widgets/add_new_product/add_product_name.dart';
import 'package:project/widgets/add_new_product/add_product_price.dart';
import 'package:project/widgets/add_new_product/submit_product.dart';

class AddNewProductScreen extends StatelessWidget {
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
              child: Text('إضافة منتج جديد', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                child: Column(
                    children: <Widget>[
                      AddProductCategory(),
                      Container(height: 20),
                      AddProductName(),
                      Container(height: 20),
                      AddProductPrice(),
                      Container(height: 20),
                      AddProductLink(),
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
