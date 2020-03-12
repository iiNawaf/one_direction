import 'package:flutter/material.dart';



class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(),
        title: Text('Product'),
        subtitle: Text('15' + ' ريال'),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit'){
              Navigator.pushNamed(context, '/editProduct');
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
