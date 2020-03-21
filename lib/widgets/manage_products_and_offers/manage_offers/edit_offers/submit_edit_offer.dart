import 'package:flutter/material.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:project/providers/offers_provider.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/edit_offer_expire_date.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/edit_offers/edit_offer_initial_date.dart';
import 'package:provider/provider.dart';

class SubmitEditOffer extends StatefulWidget {
  final Offer chosenOffer;
  final TextEditingController percentController;
  final TextEditingController imageController;
  final TextEditingController keywordController;

  SubmitEditOffer({
    @required this.chosenOffer,
    @required this.keywordController,
    @required this.imageController,
    @required this.percentController,
  });
  @override
  _SubmitEditOfferState createState() => _SubmitEditOfferState();
}

class _SubmitEditOfferState extends State<SubmitEditOffer> {
  bool isLoading = false;

  void _showMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text("موافق"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _submit() async {
    final newStartDate = EditOfferInitalDate.startDate;
    final newEndDate = EditOfferExpireDate.endDate;

    if (widget.chosenOffer.discount.toString() != widget.percentController.text ||
        widget.chosenOffer.imageUrl != widget.imageController.text ||
        widget.chosenOffer.keyword != widget.keywordController.text ||
        widget.chosenOffer.startDate != newStartDate ||
        widget.chosenOffer.endDate != newEndDate) {
      try {
        setState(() {
          isLoading = true;
        });
        final newOffer = Offer(
          companyId: widget.chosenOffer.companyId,
          offerId: widget.chosenOffer.offerId,
          noProducts: widget.chosenOffer.noProducts,
          discount: double.parse(widget.percentController.text),
          imageUrl: widget.imageController.text,
          keyword: widget.keywordController.text,
          startDate: newStartDate,
          endDate: newEndDate,
        );
        await Provider.of<OffersProvider>(context, listen: false).editOffer(newOffer);
        Provider.of<DiscountProvider>(context, listen: false).removeDiscountedProductByOfferId(newOffer.offerId);
        Navigator.of(context).pop();
      } catch (e) {
        print(e);
        setState(() {
          isLoading = false;
        });
      }
    } else {
      _showMessage(context, "لم تقم بإجراء اي تغييرات");
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
                  'اجراء التغييرات',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
  }
}
