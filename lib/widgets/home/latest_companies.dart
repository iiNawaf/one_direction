import 'package:flutter/material.dart';

class LatestCompanies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        CircleAvatar(radius: 24, backgroundImage: AssetImage('./assets/panda.png')),
        CircleAvatar(radius: 24, backgroundImage: AssetImage('./assets/danube.jpg')),
        CircleAvatar(radius: 24, backgroundImage: AssetImage('./assets/extra.png')),
        CircleAvatar(radius: 24, backgroundImage: AssetImage('./assets/jarir.jpg')),
        CircleAvatar(radius: 24, backgroundImage: AssetImage('./assets/mac.png')),
      ],
    );
  }
}
