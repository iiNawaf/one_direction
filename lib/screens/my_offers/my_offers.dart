import 'package:flutter/material.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:project/providers/offers_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:provider/provider.dart';

class MyOffersScreen extends StatefulWidget {
  @override
  _MyOffersScreenState createState() => _MyOffersScreenState();
}

class _MyOffersScreenState extends State<MyOffersScreen> {
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
        print(e);
        setState(() {
          isLoading = false;
        });
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final offersProvider = Provider.of<OffersProvider>(context, listen: false);
    final discountedProvider = Provider.of<DiscountProvider>(context);
    final companyId = Provider.of<AuthProvider>(context, listen: false).userComapny.companyId;

    discountedProvider.loadCurrentCompanyDiscountedProducts(companyId);
    final companyDiscountedCollection = discountedProvider.companyDiscountedCollection;

    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('الخصومات الخاصة بي'),
        actions: <Widget>[
          isLoading
              ? Container()
              : IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addProductOffers');
                  },
                )
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : companyDiscountedCollection.isEmpty
              ? Center(child: Text("قائمة الخصومات فارغة"))
              : Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: companyDiscountedCollection.length,
                        itemBuilder: (ctx, index) => Dismissible(
                          child: Card(
                            child: ListTile(
                              title: Container(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                width: 100,
                                height: 80,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: companyDiscountedCollection[index].products.length,
                                  itemBuilder: (ctx, colIndex) => CircleAvatar(
                                    maxRadius: 30,
                                    backgroundImage: NetworkImage(
                                      companyDiscountedCollection[index].products[colIndex].productImageUrl,
                                    ),
                                  ),
                                ),
                              ),
                              subtitle: Text(
                                  "الخصم: ${offersProvider.getOfferById(companyDiscountedCollection[index].offerId).discount.toString().split(".")[0]}%"),
                            ),
                          ),
                          key: Key(index.toString()),
                          direction: DismissDirection.startToEnd,
                          background: Container(color: Colors.red),
                          onDismissed: (dismissDirection) async {
                            try {
                              setState(() {
                                isLoading = true;
                              });
                              await discountedProvider.deleteDiscountedProducts(companyDiscountedCollection[index].offerId);
                              await discountedProvider.loadDiscountedOffers();
                              setState(() {
                                isLoading = false;
                              });
                            } catch (e) {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    companyDiscountedCollection.isEmpty ? Container() : Text('"أسحب لليسار لحذف العرض"'),
                  ],
                ),
    );
  }
}
