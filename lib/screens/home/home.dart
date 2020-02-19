import 'package:flutter/material.dart';
import 'package:project/widgets/home/latest_companies.dart';
import 'package:project/widgets/home/home_carousel.dart';
import 'package:project/widgets/home/latest_offers.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  padding: const EdgeInsets.only(right:15.0),
                  child: Row(
                    children: <Widget>[
                      Text('آخر العروض', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),

                Container(
                  height: 260.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      LatestOffers(),
                    ],
                  ),
                ),


              ],
            ),
          )
        ],
      );
  }
}
