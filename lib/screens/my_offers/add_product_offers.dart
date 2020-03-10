import 'package:flutter/material.dart';
import 'package:project/providers/auth_provider.dart';
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
  bool isInit = true;
  bool isLoading = false;
  List<int> productsIds = [];

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
      body: isLoading
          ? CircularProgressIndicator()
          : offersProvider.companyOffers.isEmpty
              ? Center(child: Text("تأكد من اضافة عروض اولاً"))
              : productstProvider.companyProducts.isEmpty
                  ? Center(child: Text("تأكد من اضافة منتجات اولاً"))
                  : Column(
                      children: <Widget>[
                        ChooseOfferPercent(offersList: offersProvider.companyOffers),
                        Container(
                          child: Text("إختيار المنتجات", style: TextStyle(fontSize: 20)),
                          padding: const EdgeInsets.symmetric(vertical: 25),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
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
                        )
                      ],
                    ),
      bottomNavigationBar: isLoading
          ? Container()
          : offersProvider.companyOffers.isEmpty
              ? Container()
              : productstProvider.companyProducts.isEmpty
                  ? Container()
                  : SubmitProductOffer(
                      offerId: ChooseOfferPercent.chosenOfferId,
                      productsList: productsIds,
                    ),
    );
  }
}
