import 'package:flutter/material.dart';

class ChooseOfferPercent extends StatefulWidget {
  static String chooseOffer = 'اختر العرض';
  @override
  _ChooseOfferPercentState createState() => _ChooseOfferPercentState();
}

class _ChooseOfferPercentState extends State<ChooseOfferPercent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      child: DropdownButton<String>(
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down),
        value: ChooseOfferPercent.chooseOffer,
        iconSize: 24,
        style: TextStyle(color: Colors.black),
        underline: Container(
          height: 1,
          color: Colors.grey,
        ),
        onChanged: (String newValue) {
          setState(() {
            ChooseOfferPercent.chooseOffer = newValue;
          });
        },
        items: <String>['اختر العرض', '1%', '2%', '3%', '4%'].map<DropdownMenuItem<String>>(
              (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
      ),
    );
  }
}
