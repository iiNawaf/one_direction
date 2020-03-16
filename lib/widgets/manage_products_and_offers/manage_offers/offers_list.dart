import 'package:flutter/material.dart';
import 'package:project/models/offer_model.dart';

class OffersList extends StatelessWidget {
  final Offer offer;

  OffersList({@required this.offer});

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
              Navigator.pushNamed(context, '/editOffer');
            } else {}
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
        ));
  }
}
