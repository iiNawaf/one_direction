import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditOfferInitalDate extends StatefulWidget {
  static DateTime startDate;
  @override
  _EditOfferInitalDateState createState() => _EditOfferInitalDateState();
}

class _EditOfferInitalDateState extends State<EditOfferInitalDate> {
  void dispose() {
    EditOfferInitalDate.startDate = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        EditOfferInitalDate.startDate == null ? 'تاريخ بداية العرض' : DateFormat('yyyy-MM-dd').format(EditOfferInitalDate.startDate),
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
            EditOfferInitalDate.startDate = date;
          });
        });
      },
    );
  }
}
