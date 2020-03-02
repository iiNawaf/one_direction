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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController arNameController = TextEditingController();
  final TextEditingController enNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController logoUrlController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

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
                onPressed: () {
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
              key: formKey,
              child: Column(
                children: <Widget>[
                  SignUpCompanyNameEN(controller: enNameController),
                  Container(height: 10),
                  SignUpCompanyNameAR(controller: arNameController),
                  Container(height: 10),
                  SignUpCompanyEmail(controller: emailController),
                  Container(height: 10),
                  SignUpCompanyNumber(controller: phoneController),
                  Container(height: 10),
                  SignUpCompanyLogoLink(controller: logoUrlController),
                  Container(height: 10),
                  SignUpCompanyWebsite(controller: urlController),
                  Container(height: 10),
                  SignUpCompanyCategory(),
                  Container(height: 25),
                  SubmitCompanySignUp(
                    formKey: formKey,
                    scaffoldKey: scaffoldKey,
                    enNameController: enNameController,
                    arNameController: arNameController,
                    emailController: emailController,
                    phoneController: phoneController,
                    logoUrlController: logoUrlController,
                    urlController: urlController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
