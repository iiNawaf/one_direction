import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AddProductInitialDate extends StatefulWidget {
  @override
  _AddProductInitialDateState createState() => _AddProductInitialDateState();
}

class _AddProductInitialDateState extends State<AddProductInitialDate> {
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        _dateTime == null
            ? 'تاريخ بداية العرض'
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
