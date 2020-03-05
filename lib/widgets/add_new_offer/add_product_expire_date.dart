import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddProductExpireDate extends StatefulWidget {
  static DateTime endDate;
  @override
  _AddProductExpireDateState createState() => _AddProductExpireDateState();
}

class _AddProductExpireDateState extends State<AddProductExpireDate> {
  @override
  void dispose() {
    AddProductExpireDate.endDate = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        AddProductExpireDate.endDate == null ? 'تاريخ نهاية العرض' : DateFormat('yyyy-MM-dd').format(AddProductExpireDate.endDate),
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
            AddProductExpireDate.endDate = date;
          });
        });
      },
    );
  }
}
