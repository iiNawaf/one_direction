import 'package:flutter/material.dart';


class CategoryLatestCompanies extends StatelessWidget {
  final List<String> restaurant;
  CategoryLatestCompanies({this.restaurant});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CircleAvatar(backgroundColor: Colors.white30, radius: 24, backgroundImage: AssetImage(restaurant[0])),
        CircleAvatar(backgroundColor: Colors.white30, radius: 24, backgroundImage: AssetImage(restaurant[1])),
        CircleAvatar(backgroundColor: Colors.white30, radius: 24, backgroundImage: AssetImage(restaurant[2])),
        CircleAvatar(backgroundColor: Colors.white30, radius: 24, backgroundImage: AssetImage(restaurant[3])),
        CircleAvatar(backgroundColor: Colors.white30, radius: 24, backgroundImage: AssetImage(restaurant[4])),
      ],
    );
  }
}
