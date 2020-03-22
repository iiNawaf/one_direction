import 'package:flutter/material.dart';
import 'package:project/models/product_model.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/edit_product/edit_product_link.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/edit_product/edit_product_name_ar.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/edit_product/edit_product_name_en.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/edit_product/edit_product_price.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/edit_product/submit_edit_product.dart';

class EditProduct extends StatelessWidget {
  final TextEditingController arNameController = TextEditingController();
  final TextEditingController enNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chosenProduct = ModalRoute.of(context).settings.arguments as Product;

    arNameController.text = chosenProduct.arName;
    enNameController.text = chosenProduct.enName;
    priceController.text = chosenProduct.price.toString();
    imageController.text = chosenProduct.imageUrl;

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
                  EditProductNameAr(controller: arNameController),
                  Container(height: 20),
                  EditProductNameEN(controller: enNameController),
                  Container(height: 20),
                  EditProductPrice(controller: priceController),
                  Container(height: 20),
                  EditProductLink(controller: imageController),
                  Container(height: 30),
                  SubmitEditProduct(
                    chosenProduct: chosenProduct,
                    imageController: imageController,
                    arNameController: arNameController,
                    priceController: priceController,
                    enNameController: enNameController,
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
