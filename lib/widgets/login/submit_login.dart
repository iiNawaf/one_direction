import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SubmitLogin extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final GlobalKey<ScaffoldState> scaffoldKey;

  SubmitLogin({@required this.formKey, @required this.scaffoldKey, @required this.usernameController, @required this.passwordController});

  @override
  _SubmitLoginState createState() => _SubmitLoginState();
}

class _SubmitLoginState extends State<SubmitLogin> {
  bool isLaoding = false;

  void _showMessage(String message) {
    widget.scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _submit() async {
    if (widget.formKey.currentState.validate()) {
      try {
        setState(() {
          isLaoding = true;
        });
        await Provider.of<AuthProvider>(context, listen: false).login(widget.usernameController.text, widget.passwordController.text);
        if (Provider.of<AuthProvider>(context, listen: false).loggedinUser.accountType == AccountType.Admin) {
          Navigator.pushReplacementNamed(context, "/admin");
        } else {
          Navigator.pushReplacementNamed(context, "/home");
        }
      } catch (e) {
        setState(() {
          isLaoding = false;
        });
        final error = e.toString().split(" ")[1];
        if (error == "NOT_FOUND") {
          _showMessage("الاسم او كلمة المرور غير صحيحة");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLaoding
        ? Container()
        : InkWell(
            onTap: _submit,
            child: Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue[200],
              child: Center(
                child: Text(
                  'تسجيل الدخول',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
  }
}
