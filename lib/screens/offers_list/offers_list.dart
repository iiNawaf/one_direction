import 'package:flutter/material.dart';
import 'package:project/widgets/offers_list/category_latest_companies.dart';
import 'package:project/widgets/offers_list/category_offers_list.dart';
import 'package:project/widgets/offers_list/category_offers_carousel.dart';

class OffersListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CategoryOffersCarousel(),

        Padding(
          padding: EdgeInsets.all(15.0),
          child: CategoryLatestCompanies()
        ),

        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 0.68,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            CategoryOffersList(),
          ],
        )


      ],
    );
  }
}
