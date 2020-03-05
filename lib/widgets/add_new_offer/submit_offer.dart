import 'package:flutter/material.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/providers/offers_provider.dart';
import 'package:project/widgets/add_new_offer/add_product_expire_date.dart';
import 'package:project/widgets/add_new_offer/add_product_inital_date.dart';
import 'package:provider/provider.dart';

class SubmitOffer extends StatefulWidget {
  final TextEditingController discountController;
  final TextEditingController imageUrlController;
  final TextEditingController keywordController;
  final GlobalKey<FormState> formKey;
  final GlobalKey<ScaffoldState> scaffoldKey;

  SubmitOffer({
    @required this.formKey,
    @required this.scaffoldKey,
    @required this.keywordController,
    @required this.imageUrlController,
    @required this.discountController,
  });

  @override
  _SubmitOfferState createState() => _SubmitOfferState();
}

class _SubmitOfferState extends State<SubmitOffer> {
  bool isLoading = false;

  void _showMessage(String message) {
    widget.scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _submit() async {
    if (widget.formKey.currentState.validate()) {
      if (AddProductInitialDate.startDate == null) {
        _showMessage("الرجاء ادخال تاريخ بدء العرض");
      } else if (AddProductExpireDate.endDate == null) {
        _showMessage("الرجاء ادخال تاريخ انتهاء العرض");
      } else {
        try {
          setState(() {
            isLoading = true;
          });
          final newoffer = Offer(
            offerId: null,
            discount: double.parse(widget.discountController.text),
            imageUrl: widget.imageUrlController.text,
            keyword: widget.keywordController.text,
            startDate: AddProductInitialDate.startDate,
            endDate: AddProductExpireDate.endDate,
          );
          final comapnyId = Provider.of<AuthProvider>(context, listen: false).userComapny.companyId;
          await Provider.of<OffersProvider>(context, listen: false).insert(comapnyId, newoffer);
          setState(() {
            isLoading = false;
          });
          Navigator.of(context).pushReplacementNamed("/myOffers");
        } catch (e) {
          setState(() {
            isLoading = false;
          });
        }
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
