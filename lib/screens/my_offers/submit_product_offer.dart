import 'package:flutter/material.dart';


class SubmitProductOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 50,
        color: Colors.blue[300],
        child: Center(
          child: Text(
              'تأكيد',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
