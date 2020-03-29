import 'package:flutter/material.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:project/widgets/my_offers/choose_offers_percent.dart';
import 'package:provider/provider.dart';

class SubmitProductOffer extends StatefulWidget {
  final List<int> productsList;

  SubmitProductOffer({@required this.productsList});

  @override
  _SubmitProductOfferState createState() => _SubmitProductOfferState();
}

class _SubmitProductOfferState extends State<SubmitProductOffer> {
  bool isSummiting = false;

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
    final offerId = ChooseOfferPercent.chosenOfferId;
    if (offerId != null && widget.productsList.isNotEmpty) {
      try {
        setState(() {
          isSummiting = true;
        });
        final discountProvider = Provider.of<DiscountProvider>(context, listen: false);
        await discountProvider.applyOffer(offerId, widget.productsList);
        await discountProvider.loadDiscountedOffers();
        Navigator.of(context).pop();
      } catch (e) {
        setState(() {
          isSummiting = false;
        });
        final message = e.toString().split(":")[1].split(" ")[1];
        if (message == "PRODUCT_ALREADY_APPLIED") {
          _showMessage(context, "بعض المنتجات التي تم اختيارها معروضة مسبقاً");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isSummiting
        ? Center(child: CircularProgressIndicator())
        : InkWell(
            onTap: _submit,
            child: Container(
              height: 50,
              color: Colors.blue[300],
              child: Center(
                child: Text(
                  'تأكيد',
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          );
  }
}
