import 'package:flutter/material.dart';
import 'package:project/widgets/sign_up/companies_sign_up/sign_up_company_confirm_password.dart';
import 'package:project/widgets/sign_up/companies_sign_up/sign_up_company_email.dart';
import 'package:project/widgets/sign_up/companies_sign_up/sign_up_company_name_AR.dart';
import 'package:project/widgets/sign_up/companies_sign_up/sign_up_company_name_EN.dart';
import 'package:project/widgets/sign_up/companies_sign_up/sign_up_company_number.dart';
import 'package:project/widgets/sign_up/companies_sign_up/sign_up_company_password.dart';
import 'package:project/widgets/sign_up/companies_sign_up/sign_up_company_username.dart';
import 'package:project/widgets/sign_up/companies_sign_up/sign_up_company_website.dart';
import 'package:project/widgets/sign_up/companies_sign_up/submit_company_sign_up.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/sign_up_city.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/sign_up_confirm_password.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/sign_up_email.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/sign_up_password.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/sign_up_username.dart';
import 'package:project/widgets/sign_up/individuals_sign_up/submit_sign_up.dart';

enum CreatedAccountType {individual, comapany}

CreatedAccountType _accountType = CreatedAccountType.individual;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  _accountType = CreatedAccountType.individual;
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
                children: signUpForm()
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> signUpForm(){
    if(_accountType == CreatedAccountType.individual){
      return [
        SignUpUsername(),
        Container(height: 20),
        SignUpEmail(),
        Container(height: 20),
        SignUpPassword(),
        Container(height: 20),
        SignUpConfirmPassword(),
        Container(height: 20),
        SignUpCity(),
        Container(height: 35),
        SubmitSignUp(),
        Center(
            child: FlatButton(
              onPressed: (){
                setState(() {
                  _accountType = CreatedAccountType.comapany;
                });
              },
              child: Text('تسجيل حساب شركة', style: TextStyle(fontWeight: FontWeight.bold)),
            )
        )
      ];
    }else{
      return [
        SignUpCompanyNameEN(),
        Container(height: 10),
        SignUpCompanyNameAR(),
        Container(height: 10),
        SignUpCompanyEmail(),
        Container(height: 10),
        SignUpCompanyNumber(),
        Container(height: 10),
        SignUpCompanyWebsite(),
        Container(height: 10),
        SignUpCompanyUsername(),
        Container(height: 10),
        SignUpCompanyPassword(),
        Container(height: 10),
        SignUpCompanyConfirmPassword(),
        Container(height: 25),
        SubmitCompanySignUp(),
        Center(
            child: FlatButton(
              onPressed: (){
                setState(() {
                  _accountType = CreatedAccountType.individual;
                });
              },
              child: Text('تسجيل حساب الأفراد', style: TextStyle(fontWeight: FontWeight.bold)),
            )
        )
      ];
    }
  }
}
