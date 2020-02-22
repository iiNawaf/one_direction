import 'package:flutter/material.dart';


class AddProductCategory extends StatefulWidget {
  @override
  _AddProductCategoryState createState() => _AddProductCategoryState();
}

class _AddProductCategoryState extends State<AddProductCategory> {
  String productCategoryValue = 'اختر';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.more_horiz, color: Colors.blue[200]),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width,
            child: DropdownButton<String>(
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down),
              value: productCategoryValue,
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
                  productCategoryValue = newValue;
                });
              },
              items: <String>['اختر', 'مطعم', 'كافيه', 'إلكترونيات', 'أسواق']
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