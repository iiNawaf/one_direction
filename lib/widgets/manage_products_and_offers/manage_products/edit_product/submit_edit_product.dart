import 'package:flutter/material.dart';
import 'package:project/models/product_model.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:provider/provider.dart';

class SubmitEditProduct extends StatefulWidget {
  final Product chosenProduct;
  final TextEditingController arNameController;
  final TextEditingController enNameController;
  final TextEditingController priceController;
  final TextEditingController imageController;

  SubmitEditProduct({
    @required this.chosenProduct,
    @required this.imageController,
    @required this.priceController,
    @required this.enNameController,
    @required this.arNameController,
  });
  @override
  _SubmitEditProductState createState() => _SubmitEditProductState();
}

class _SubmitEditProductState extends State<SubmitEditProduct> {
  bool isLoading = false;

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text("موافق"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  void _submit() async {
    if (widget.arNameController.text != widget.chosenProduct.arName ||
        widget.enNameController.text != widget.chosenProduct.enName ||
        widget.imageController.text != widget.chosenProduct.imageUrl ||
        widget.priceController.text != widget.chosenProduct.price.toString()) {
      try {
        setState(() {
          isLoading = true;
        });
        //create new product with new data
        final newProduct = Product(
          productId: widget.chosenProduct.productId,
          companyId: widget.chosenProduct.companyId,
          arName: widget.arNameController.text,
          enName: widget.enNameController.text,
          price: double.parse(widget.priceController.text),
          imageUrl: widget.imageController.text,
          category: widget.chosenProduct.category,
        );
        await Provider.of<ProductsProvider>(context, listen: false).editProduct(newProduct);
        Provider.of<DiscountProvider>(context, listen: false).removeDiscountedProductByProductId(newProduct.productId);
        Navigator.of(context).pop();
      } catch (e) {
        print(e);
        setState(() {
          isLoading = false;
        });
      }
    } else {
      _showMessage("لم تقم بإجراء اي تغييرات");
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
                  'إجراء التغييرات',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
  }
}
