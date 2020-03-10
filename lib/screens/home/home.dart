import 'package:flutter/material.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:project/widgets/home/latest_companies.dart';
import 'package:project/widgets/home/home_carousel.dart';
import 'package:project/widgets/home/latest_offers.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final discountProvider = Provider.of<DiscountProvider>(context);

    return RefreshIndicator(
      onRefresh: () async => await discountProvider.loadDiscountedOffers(),
      child: ListView(
        children: <Widget>[
          HomeCarousel(),
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: LatestCompanies(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'آخر العروض',
                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                discountProvider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : discountProvider.discountedProductsList.isEmpty
                        ? Center(child: Text("لا توجد عروض حالياَ"))
                        : Container(
                            height: 260.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: discountProvider.discountedProductsList.length,
                              itemBuilder: (ctx, index) => LatestOffers(discountedProduct: discountProvider.discountedProductsList[index]),
                            ),
                          ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
