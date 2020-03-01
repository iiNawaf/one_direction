import 'package:flutter/material.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SubmitSignUp extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  SubmitSignUp({@required this.formKey, @required this.usernameController, @required this.passwordController});

  @override
  _SubmitSignUpState createState() => _SubmitSignUpState();
}

class _SubmitSignUpState extends State<SubmitSignUp> {
  bool isLoading = false;

  void _submit() async {
    if (widget.formKey.currentState.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        await Provider.of<AuthProvider>(context, listen: false).signup(widget.usernameController.text, widget.passwordController.text);
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        print(e);
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
