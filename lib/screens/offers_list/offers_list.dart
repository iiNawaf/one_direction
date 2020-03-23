import 'package:flutter/material.dart';
import 'package:project/models/discounted_product_model.dart';
import 'package:project/widgets/home/latest_offers.dart';
import 'package:project/widgets/offers_list/category_latest_companies.dart';
import 'package:project/widgets/offers_list/category_offers_carousel.dart';

class OffersListScreen extends StatelessWidget {
  final List<DiscountedProduct> list;

  OffersListScreen({@required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CategoryOffersCarousel(),
        Padding(padding: EdgeInsets.all(15.0), child: CategoryLatestCompanies()),
        list.isEmpty
            ? Center(child: Text("لا توجد منتجات"))
            : GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 4,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: list.length,
                itemBuilder: (ctx, index) => LatestOffers(discountedProduct: list[index]),
              )
      ],
    );
  }
}
