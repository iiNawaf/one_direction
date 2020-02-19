import 'package:flutter/material.dart';


class SubmitSuggestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.blue[200],
      child: Center(
        child: Text('إرسال' ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
