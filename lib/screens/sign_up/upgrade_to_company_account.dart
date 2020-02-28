import 'package:flutter/material.dart';
import 'package:project/widgets/sign_up/upgrade_to_company_account/sign_up_company_category.dart';
import 'package:project/widgets/sign_up/upgrade_to_company_account/sign_up_company_email.dart';
import 'package:project/widgets/sign_up/upgrade_to_company_account/sign_up_company_logo_link.dart';
import 'package:project/widgets/sign_up/upgrade_to_company_account/sign_up_company_name_AR.dart';
import 'package:project/widgets/sign_up/upgrade_to_company_account/sign_up_company_name_EN.dart';
import 'package:project/widgets/sign_up/upgrade_to_company_account/sign_up_company_number.dart';
import 'package:project/widgets/sign_up/upgrade_to_company_account/sign_up_company_website.dart';
import 'package:project/widgets/sign_up/upgrade_to_company_account/submit_company_sign_up.dart';


class UpgradeToCompanyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      body: ListView(
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
          Center(
            child: Text('ترقية إلى حساب شركة', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              child: Column(
                  children: <Widget>[
                    SignUpCompanyNameEN(),
                    Container(height: 10),
                    SignUpCompanyNameAR(),
                    Container(height: 10),
                    SignUpCompanyEmail(),
                    Container(height: 10),
                    SignUpCompanyNumber(),
                    Container(height: 10),
                    SignUpCompanyLogoLink(),
                    Container(height: 10),
                    SignUpCompanyWebsite(),
                    Container(height: 10),
                    SignUpCompanyCategory(),
                    Container(height: 25),
                    SubmitCompanySignUp(),

                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}
