import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddProductExpireDate extends StatefulWidget {
  @override
  _AddProductExpireDateState createState() => _AddProductExpireDateState();
}

class _AddProductExpireDateState extends State<AddProductExpireDate> {
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        _dateTime == null
            ? 'تاريخ نهاية العرض'
            : DateFormat('yyyy-MM-dd').format(_dateTime),
        style: TextStyle(color: Colors.blue),
      ),
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        ).then((date){
          setState(() {
            _dateTime = date;
          });
        });
      },
    );
  }
}
