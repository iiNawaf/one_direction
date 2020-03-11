import 'package:flutter/material.dart';


class OffersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(),
        title: Text('50%'),
        subtitle: Text('21-9-2019'+ ' إلى ' + '19-9-2019'),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit'){
              Navigator.pushNamed(context, '/editOffer');
            }else{

            }
          },
          itemBuilder: (BuildContext context) =>[
            const PopupMenuItem(
              value: 'edit',
              child: Text('تعديل'),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Text('حذف'),
            ),
          ],
        )
    );
  }
}
