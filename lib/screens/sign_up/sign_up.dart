import 'package:flutter/material.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/sign_up_confirm_password.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/sign_up_password.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/sign_up_username.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/submit_sign_up.dart';



class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ],
          ),
          SizedBox(height: 10),
          Center(
            child: Text('تسجيل حساب جديد', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  SignUpUsername(),
              Container(height: 20),
              SignUpPassword(),
              Container(height: 20),
              SignUpConfirmPassword(),
              Container(height: 20),
              SubmitSignUp(),
    ]
            ),
          ),
            )
    ]
      ),
    );
  }
}
