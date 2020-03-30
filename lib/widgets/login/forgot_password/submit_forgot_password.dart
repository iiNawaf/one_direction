import 'package:flutter/material.dart';

class SubmitForgotPassword extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  SubmitForgotPassword({this.formKey, @required this.emailController});

  @override
  _SubmitForgotPasswordState createState() => _SubmitForgotPasswordState();
}

class _SubmitForgotPasswordState extends State<SubmitForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
