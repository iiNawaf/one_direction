import 'package:flutter/material.dart';
import 'package:project/models/product_model.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatelessWidget {
  final Product product;

  ProductsList({@required this.product});

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
      leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl)),
      title: Text('${product.arName} - ${product.enName}'),
      subtitle: Text('${product.price}' + ' ريال'),
      trailing: PopupMenuButton(
        onSelected: (value) {
          if (value == 'edit') {
            showMessage(
              context,
              "سيتم إزالة هذا المنتج من قائمة الخصومات في حال تعديله, موافق؟",
              () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/editProduct', arguments: product);
              },
            );
          } else if (value == "delete") {
            showMessage(
              context,
              "سيتم إزالة هذا المنتج من قائمة الخصومات في حال حذفه, موافق؟",
              () async {
                try {
                  await Provider.of<ProductsProvider>(context, listen: false).deleteProduct(product.productId);
                  Provider.of<DiscountProvider>(context, listen: false).removeDiscountedProductByProductId(product.productId);
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
