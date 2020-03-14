import 'package:flutter/material.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:provider/provider.dart';

class MyOffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final discountedProvider = Provider.of<DiscountProvider>(context);
    final companyId = Provider.of<AuthProvider>(context).userComapny.companyId;

    discountedProvider.loadCurrentCompanyDiscountedProducts(companyId);
    final discountedProductsList = discountedProvider.currentCompanyDiscountedProducts;

    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('العروض الخاصة بي'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addProductOffers');
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: discountedProductsList.length,
              itemBuilder: (ctx, index) => Dismissible(
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(discountedProductsList[index].productImageUrl)),
                    title: Text(discountedProductsList[index].productName),
                    subtitle: Text(discountedProductsList[index].discount.toString().split(".")[0] + "%"),
                  ),
                ),
                key: Key(index.toString()),
                direction: DismissDirection.startToEnd,
                background: Container(color: Colors.red),
                onDismissed: null,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text('"أسحب لليسار لحذف العرض"'),
        ],
      ),
    );
  }
}
