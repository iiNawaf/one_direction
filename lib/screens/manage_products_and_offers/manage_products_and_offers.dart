import 'package:flutter/material.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/providers/offers_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/widgets/manage_products_and_offers/manage_offers/offers_list.dart';
import 'package:project/widgets/manage_products_and_offers/manage_products/products_list.dart';
import 'package:provider/provider.dart';

class ManageProductAndOffers extends StatefulWidget {
  @override
  _ManageProductAndOffersState createState() => _ManageProductAndOffersState();
}

class _ManageProductAndOffersState extends State<ManageProductAndOffers> {
  bool isInit = true;
  bool isLoading = false;

  @override
  void didChangeDependencies() async {
    if (isInit) {
      isInit = false;
      try {
        setState(() {
          isLoading = true;
        });
        final companyId = Provider.of<AuthProvider>(context, listen: false).userComapny.companyId;
        await Provider.of<OffersProvider>(context, listen: false).loadOffers(companyId);
        await Provider.of<ProductsProvider>(context, listen: false).loadProducts(companyId);
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
        });
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final offersProvider = Provider.of<OffersProvider>(context);
    final productsProvider = Provider.of<ProductsProvider>(context);
    final offersList = offersProvider.companyOffers;
    final productsList = productsProvider.companyProducts;

    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('ادارة'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                offersList.isEmpty
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'عروضي',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                offersList.isEmpty
                    ? Container()
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: offersList.length,
                        itemBuilder: (ctx, index) => OffersList(offer: offersList[index]),
                      ),
                Divider(),
                productsList.isEmpty
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'منتجاتي',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                productsList.isEmpty
                    ? Container()
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: productsList.length,
                        itemBuilder: (ctx, index) => ProductsList(product: productsList[index]),
                      ),
              ],
            ),
    );
  }
}
