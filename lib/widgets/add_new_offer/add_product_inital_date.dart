import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddProductInitialDate extends StatefulWidget {
  static DateTime startDate;
  @override
  _AddProductInitialDateState createState() => _AddProductInitialDateState();
}

class _AddProductInitialDateState extends State<AddProductInitialDate> {
  @override
  void dispose() {
    AddProductInitialDate.startDate = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        AddProductInitialDate.startDate == null ? 'تاريخ بداية العرض' : DateFormat('yyyy-MM-dd').format(AddProductInitialDate.startDate),
        style: TextStyle(color: Colors.blue),
      ),
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        ).then((date) {
          setState(() {
            AddProductInitialDate.startDate = date;
          });
        });
      },
    );
  }
}
