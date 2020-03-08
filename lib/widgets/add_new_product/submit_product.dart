import 'package:flutter/material.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/models/product_model.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/providers/offers_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/widgets/add_new_offer/add_product_expire_date.dart';
import 'package:project/widgets/add_new_offer/add_product_inital_date.dart';
import 'package:provider/provider.dart';

class SubmitProduct extends StatefulWidget {
  final TextEditingController arNameController;
  final TextEditingController enNameController;
  final TextEditingController priceController;
  final TextEditingController imageUrlController;
  final GlobalKey<FormState> formKey;
  final GlobalKey<ScaffoldState> scaffoldKey;

  SubmitProduct({
    @required this.formKey,
    @required this.scaffoldKey,
    @required this.arNameController,
    @required this.imageUrlController,
    @required this.priceController,
    @required this.enNameController,
  });

  @override
  _SubmitProductState createState() => _SubmitProductState();
}

class _SubmitProductState extends State<SubmitProduct> {
  bool isLoading = false;

  void _showMessage(String message) {
    widget.scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _clearInputs() {
    widget.priceController.clear();
    widget.arNameController.clear();
    widget.enNameController.clear();
    widget.imageUrlController.clear();
  }

  void _submit() async {
    if (widget.formKey.currentState.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        final companyData = Provider.of<AuthProvider>(context, listen: false).userComapny;
        final comapnyId = companyData.companyId;
        final newProduct = Product(
          companyId: comapnyId,
          arName: widget.arNameController.text,
          enName: widget.enNameController.text,
          category: companyData.category,
          imageUrl: widget.imageUrlController.text,
          price: double.parse(widget.priceController.text),
          productId: null,
        );
        await Provider.of<ProductsProvider>(context, listen: false).insert(newProduct);
        setState(() {
          isLoading = false;
        });
        _clearInputs();
        _showMessage("تم اضافة المنتج");
      } catch (e) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : InkWell(
            onTap: _submit,
            child: Container(
              height: 50,
              color: Colors.blue[200],
              child: Center(
                child: Text(
                  'إضافة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
  }
}
