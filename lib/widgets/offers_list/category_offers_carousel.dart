import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project/models/discounted_product_model.dart';


class CategoryOffersCarousel extends StatelessWidget {
  final String banner;
  CategoryOffersCarousel({this.banner});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      viewportFraction: 1.0,
      height: 150.0,
      items: [
        Image.asset(banner, fit: BoxFit.cover)
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                child: i
            );
          },
        );
      }).toList(),
    );
  }
}
