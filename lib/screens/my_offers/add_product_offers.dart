import 'package:flutter/material.dart';
import 'package:project/providers/offers_provider.dart';
import 'package:project/providers/products_provider.dart';
import 'package:project/screens/my_offers/submit_product_offer.dart';
import 'package:project/widgets/my_offers/choose_offers_percent.dart';
import 'package:provider/provider.dart';

class AddProductOffersScreen extends StatefulWidget {
  @override
  _AddProductOffersScreenState createState() => _AddProductOffersScreenState();
}

class _AddProductOffersScreenState extends State<AddProductOffersScreen> {
  List<int> productsIds = [];

  bool isInTheList(int id) {
    return productsIds.indexWhere((element) => element == id) == -1 ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    final offersProvider = Provider.of<OffersProvider>(context);
    final productstProvider = Provider.of<ProductsProvider>(context);
    final companyProducts = productstProvider.companyProducts;

    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('تطبيق العروض على المنتجات'),
      ),
      body: offersProvider.companyOffers.isEmpty
          ? Center(child: Text("تأكد من اضافة عروض اولاً"))
          : productstProvider.companyProducts.isEmpty
              ? Center(child: Text("تأكد من اضافة منتجات اولاً"))
              : Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text("إختيار احد العروض", style: TextStyle(fontSize: 20)),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          ChooseOfferPercent(offersList: offersProvider.companyOffers),
                        ],
                      ),
                    ),
                    Container(
                      child: Text("إختيار المنتجات", style: TextStyle(fontSize: 20)),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: companyProducts.length,
                        itemBuilder: (ctx, index) => ListTile(
                          onTap: () {
                            setState(() {
                              if (isInTheList(companyProducts[index].productId)) {
                                productsIds.removeWhere((element) => element == companyProducts[index].productId);
                              } else {
                                productsIds.add(companyProducts[index].productId);
                              }
                            });
                          },
                          leading: CircleAvatar(backgroundImage: NetworkImage(companyProducts[index].imageUrl)),
                          title: Text("${companyProducts[index].arName} - ${companyProducts[index].enName}"),
                          subtitle: Text(companyProducts[index].price.toString() + "ريال"),
                          trailing: isInTheList(companyProducts[index].productId) ? Icon(Icons.check_box) : null,
                        ),
                      ),
                    ),
                  ],
                ),
      bottomNavigationBar: offersProvider.companyOffers.isEmpty
          ? null
          : productstProvider.companyProducts.isEmpty
              ? null
              : SubmitProductOffer(
                  productsList: productsIds,
                ),
    );
  }
}
