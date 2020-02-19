import 'package:flutter/material.dart';


class SubmitCompanySignUp extends StatelessWidget {
  final text = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue[200],
        child: Center(
          child: Text('تسجيل', style: text),
        ),
      ),
    );
  }
}
