import 'package:flutter/material.dart';
import 'package:project/widgets/add_new_product/add_product_en_name.dart';
import 'package:project/widgets/add_new_product/add_product_link.dart';
import 'package:project/widgets/add_new_product/add_product_name.dart';
import 'package:project/widgets/add_new_product/add_product_price.dart';
import 'package:project/widgets/add_new_product/submit_product.dart';

class AddNewProductScreen extends StatefulWidget {
  @override
  _AddNewProductScreenState createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController arNameController = TextEditingController();
  final TextEditingController enNameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
            child: Text('إضافة منتج جديد', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(children: <Widget>[
                AddProductName(controller: arNameController),
                Container(height: 20),
                AddProductEnName(controller: enNameController),
                Container(height: 20),
                AddProductPrice(controller: priceController),
                Container(height: 20),
                AddProductLink(controller: imageUrlController),
                Container(height: 30),
                SubmitProduct(
                  arNameController: arNameController,
                  enNameController: enNameController,
                  imageUrlController: imageUrlController,
                  priceController: priceController,
                  formKey: formKey,
                  scaffoldKey: scaffoldKey,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
