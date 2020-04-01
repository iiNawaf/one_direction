import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class HomeCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      viewportFraction: 1.0,
      height: 150.0,
      items: [
        Image.asset('./assets/saleswow.png', fit: BoxFit.cover)
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
