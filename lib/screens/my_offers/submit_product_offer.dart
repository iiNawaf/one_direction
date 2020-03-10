import 'package:flutter/material.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:provider/provider.dart';

class SubmitProductOffer extends StatefulWidget {
  final int offerId;
  final List<int> productsList;

  SubmitProductOffer({@required this.offerId, @required this.productsList});

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
    if (widget.offerId != null && widget.productsList.isNotEmpty) {
      try {
        setState(() {
          isSummiting = true;
        });
        await Provider.of<DiscountProvider>(context, listen: false).applyOffer(widget.offerId, widget.productsList);
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
