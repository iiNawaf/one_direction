import 'package:flutter/material.dart';


class SubmitEditOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 50,
        color: Colors.blue[200],
        child: Center(
          child: Text(
            'اجراء التغييرات',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
