import 'package:flutter/material.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/sign_up_confirm_password.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/sign_up_password.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/sign_up_username.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/submit_sign_up.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordComfirmController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xffe8f0f2),
      body: ListView(shrinkWrap: true, children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
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
            key: formKey,
            child: Column(children: <Widget>[
              SignUpUsername(controller: usernameController),
              Container(height: 20),
              SignUpPassword(controller: passwordController),
              Container(height: 20),
              SignUpConfirmPassword(controller: passwordComfirmController, passwordController: passwordController),
              Container(height: 20),
              SubmitSignUp(formKey: formKey, scaffoldKey: scaffoldKey, usernameController: usernameController, passwordController: passwordController),
            ]),
          ),
        )
      ]),
    );
  }
}
