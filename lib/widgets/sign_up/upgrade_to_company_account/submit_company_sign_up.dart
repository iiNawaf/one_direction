import 'package:flutter/material.dart';
import 'package:project/models/company_model.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/widgets/sign_up/upgrade_to_company_account/sign_up_company_category.dart';
import 'package:provider/provider.dart';

class SubmitCompanySignUp extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final TextEditingController arNameController;
  final TextEditingController enNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController logoUrlController;
  final TextEditingController urlController;

  SubmitCompanySignUp({
    @required this.formKey,
    @required this.scaffoldKey,
    @required this.arNameController,
    @required this.enNameController,
    @required this.emailController,
    @required this.phoneController,
    @required this.logoUrlController,
    @required this.urlController,
  });

  @override
  _SubmitCompanySignUpState createState() => _SubmitCompanySignUpState();
}

class _SubmitCompanySignUpState extends State<SubmitCompanySignUp> {
  bool isLoading = false;

  void _submit() async {
    if (widget.formKey.currentState.validate()) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text("ستحتاج الي تسجيل الدخول مرة اخرى لتأكيد التغييرات"),
          actions: <Widget>[
            FlatButton(
              child: Text("موافق"),
              onPressed: () async {
                Navigator.of(context).pop();
                try {
                  setState(() {
                    isLoading = true;
                  });
                  final authProvider = Provider.of<AuthProvider>(context, listen: false);
                  final userId = authProvider.loggedinUser.userId;
                  final companyInfo = Company(
                    companyId: null,
                    enName: widget.enNameController.text,
                    arName: widget.arNameController.text,
                    email: widget.emailController.text,
                    phone: widget.phoneController.text,
                    logoUrl: widget.logoUrlController.text,
                    url: widget.urlController.text,
                    category: SignUpCompanyCategory.companyCategoryValue,
                  );
                  await authProvider.upgradeToCompany(userId, companyInfo);
                  authProvider.signout();
                  Navigator.pushReplacementNamed(context, "/home");
                  setState(() {
                    isLoading = false;
                  });
                } catch (e) {
                  print(e);
                  setState(() {
                    isLoading = false;
                  });
                }
              },
            ),
            FlatButton(
              child: Text("الغاء"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : InkWell(
            onTap: _submit,
            child: Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue[200],
              child: Center(
                child: Text(
                  'تسجيل الشركة',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
  }
}
