import 'package:flutter/material.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SubmitSignUp extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SubmitSignUp({
    @required this.formKey,
    @required this.scaffoldKey,
    @required this.usernameController,
    @required this.emailController,
    @required this.passwordController,
  });

  @override
  _SubmitSignUpState createState() => _SubmitSignUpState();
}

class _SubmitSignUpState extends State<SubmitSignUp> {
  bool isLoading = false;

  void _showMessage(String message) {
    widget.scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _submit() async {
    if (widget.formKey.currentState.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        await Provider.of<AuthProvider>(context, listen: false).signup(
          widget.usernameController.text,
          widget.emailController.text,
          widget.passwordController.text,
        );
        Navigator.of(context).pushReplacementNamed("/login");
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        final error = e.toString().split(" ")[1];
        if (error == "ACCOUNT_EXIST") {
          _showMessage("الحساب موجود مسبقاً");
        } else if (error == "USER_CREATION_FAILED") {
          _showMessage("حدث خطأ ما, لم نتمكن من إكمال طلبك");
        } else if (error == "EMAIL_EXIST") {
          _showMessage("الإيميل موجود مسبقاً");
        }
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : InkWell(
            onTap: _submit,
            child: Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue[200],
              child: Center(
                child: Text(
                  'تسجيل',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
  }
}
