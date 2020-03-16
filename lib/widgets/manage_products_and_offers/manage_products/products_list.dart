import 'package:flutter/material.dart';
import 'package:project/models/product_model.dart';

class ProductsList extends StatelessWidget {
  final Product product;

  ProductsList({@required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl)),
        title: Text('${product.arName} - ${product.enName}'),
        subtitle: Text('${product.price}' + ' ريال'),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit') {
              Navigator.pushNamed(context, '/editProduct');
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
