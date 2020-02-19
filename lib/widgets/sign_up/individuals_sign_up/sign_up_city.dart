import 'package:flutter/material.dart';


class SignUpCity extends StatefulWidget {
  @override
  _SignUpCityState createState() => _SignUpCityState();
}

class _SignUpCityState extends State<SignUpCity> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.location_on, color: Colors.blue[200]),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width,
            child: DropdownButton<String>(
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down),
              value: dropdownValue,
              iconSize: 24,
              style: TextStyle(
                  color: Colors.black
              ),
              underline: Container(
                height: 1,
                color: Colors.grey,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
