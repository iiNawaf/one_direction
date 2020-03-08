import 'package:flutter/material.dart';
import 'package:project/models/offer_model.dart';

class ChooseOfferPercent extends StatefulWidget {
  static int chosenOfferId;
  final List<Offer> offersList;

  ChooseOfferPercent({@required this.offersList});

  @override
  _ChooseOfferPercentState createState() => _ChooseOfferPercentState();
}

class _ChooseOfferPercentState extends State<ChooseOfferPercent> {
  @override
  void initState() {
    ChooseOfferPercent.chosenOfferId = widget.offersList[0].offerId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      child: DropdownButton<String>(
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down),
        value: widget.offersList.firstWhere((element) => element.offerId == ChooseOfferPercent.chosenOfferId).discount.toString(),
        iconSize: 24,
        style: TextStyle(color: Colors.black),
        underline: Container(
          height: 1,
          color: Colors.grey,
        ),
        onChanged: (String newValue) {
          setState(() {
            ChooseOfferPercent.chosenOfferId =
                widget.offersList.firstWhere((element) => element.discount.toString() == newValue.split("%")[0]).offerId;
          });
        },
        items: widget.offersList.map<DropdownMenuItem<String>>(
          (Offer value) {
            return DropdownMenuItem<String>(
              value: value.discount.toString(),
              child: Text(value.discount.toString() + "%"),
            );
          },
        ).toList(),
      ),
    );
  }
}
