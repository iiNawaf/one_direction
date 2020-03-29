import 'package:flutter/material.dart';


class SubmitChangePassword extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  SubmitChangePassword({this.formKey});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        height: 50.0,
        color: Colors.blue[200],
        child: FlatButton(
          onPressed: () {
            if(!formKey.currentState.validate()){

            }
          },
          child: Center(
            child: Text('استعادة', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
