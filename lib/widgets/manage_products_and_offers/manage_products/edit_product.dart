import 'package:flutter/material.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/edit_product/edit_product_link.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/edit_product/edit_product_name_ar.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/edit_product/edit_product_name_en.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/edit_product/edit_product_price.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/edit_product/submit_edit_product.dart';


class EditProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('تعديل المنتج'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(30),
            child: Form(
              child: Column(
                children: <Widget>[
                  EditProductNameAr(),
                  Container(height: 20),
                  EditProductNameEN(),
                  Container(height: 20),
                  EditProductPrice(),
                  Container(height: 20),
                  EditProductLink(),
                  Container(height: 30),
                  SubmitEditProduct()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
