import 'package:flutter/material.dart';


class CategoryLatestCompanies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CircleAvatar(radius: 24, backgroundImage: AssetImage('./assets/mac.png')),
        CircleAvatar(radius: 24, backgroundImage: AssetImage('./assets/mac.png')),
        CircleAvatar(radius: 24, backgroundImage: AssetImage('./assets/mac.png')),
        CircleAvatar(radius: 24, backgroundImage: AssetImage('./assets/mac.png')),
        CircleAvatar(radius: 24, backgroundImage: AssetImage('./assets/mac.png')),
      ],
    );
  }
}
