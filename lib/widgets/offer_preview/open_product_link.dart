import 'package:flutter/material.dart';


class OpenProductLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //go to website offer link
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: Colors.blue[200],
        child: Center(
            child: Text('الذهاب لصفحة العرض', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
        ),
      ),
    );
  }
}
