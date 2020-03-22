import 'package:flutter/material.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:project/providers/offers_provider.dart';
import 'package:provider/provider.dart';

class OffersList extends StatelessWidget {
  final Offer offer;

  OffersList({@required this.offer});

  void showMessage(BuildContext context, String message, Function acceptHandler) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text("موافق"),
            onPressed: acceptHandler,
          ),
          FlatButton(
            child: Text("الغاء"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(offer.imageUrl),
      ),
      title: Text('${offer.discount.toString().split(".")[0]}%'),
      subtitle: Text('${offer.startDate.toString().split(" ")[0]} الى ${offer.endDate.toString().split(" ")[0]}'),
      trailing: PopupMenuButton(
        onSelected: (value) {
          if (value == 'edit') {
            showMessage(
              context,
              "سيتم حذف جميع الخصومات المرتبطة بهذا العرض في حال تعديله, موافق؟",
              () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/editOffer", arguments: offer);
              },
            );
          } else if (value == "delete") {
            showMessage(
              context,
              "سيتم حذف جميع الخصومات المرتبطة بهذا العرض في حال حذفه, موافق؟",
              () async {
                try {
                  await Provider.of<OffersProvider>(context, listen: false).deleteOffer(offer.offerId);
                  Provider.of<DiscountProvider>(context, listen: false).removeDiscountedProductByOfferId(offer.offerId);
                  Navigator.of(context).pop();
                } catch (e) {
                  print(e);
                }
              },
            );
          }
        },
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(
            value: 'edit',
            child: Text('تعديل'),
          ),
          const PopupMenuItem(
            value: 'delete',
            child: Text('حذف'),
          ),
        ],
      ),
    );
  }
}
