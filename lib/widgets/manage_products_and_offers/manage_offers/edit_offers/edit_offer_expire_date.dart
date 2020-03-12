import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class EditOfferExpireDate extends StatefulWidget {
  static DateTime endDate;
  @override
  _EditOfferExpireDateState createState() => _EditOfferExpireDateState();
}

class _EditOfferExpireDateState extends State<EditOfferExpireDate> {
  void dispose() {
    EditOfferExpireDate.endDate = null;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        EditOfferExpireDate.endDate == null ? 'تاريخ نهاية العرض' : DateFormat('yyyy-MM-dd').format(EditOfferExpireDate.endDate),
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
            EditOfferExpireDate.endDate = date;
          });
        });
      },
    );
  }
}
