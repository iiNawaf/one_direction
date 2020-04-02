import 'package:flutter/material.dart';
import 'package:project/models/discounted_product_model.dart';
import 'package:project/widgets/home/latest_offers.dart';
import 'package:project/widgets/offers_list/category_latest_companies.dart';
import 'package:project/widgets/offers_list/category_offers_carousel.dart';

class OffersListScreen extends StatelessWidget {
  final List<DiscountedProduct> list;
  final String banner;
  final List<String> categories;
  OffersListScreen({@required this.list, this.banner, this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CategoryOffersCarousel(banner: banner),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text('الاكثر رواجا', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(padding: EdgeInsets.all(15.0), child: CategoryLatestCompanies(restaurant: categories)),
        list.isEmpty
            ? Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Text(
                    "لا توجد خصومات في الوقت الحالي",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 5,
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
