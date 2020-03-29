import 'package:flutter/material.dart';
import 'package:project/widgets/change_password/current_password.dart';
import 'package:project/widgets/change_password/new_password.dart';
import 'package:project/widgets/change_password/submit_change_password.dart';
import 'package:project/widgets/login/forgot_password/email.dart';
import 'package:project/widgets/login/forgot_password/submit_forgot_password.dart';


class ChangePasswordScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      body: Form(
        key: formKey,
        child: ListView(
          children: <Widget>[
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
            SizedBox(height: 30),
            Center(
              child: Text('تغيير كلمة المرور', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 50),
            CurrentPassword(),
            NewPassword(),
            SubmitChangePassword(formKey: formKey)
          ],
        ),
      ),
    );
  }
}
