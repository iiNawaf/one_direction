import 'package:flutter/material.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SubmitChangePassword extends StatefulWidget {
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;

  final GlobalKey<FormState> formKey;
  SubmitChangePassword({this.formKey, @required this.oldPasswordController, @required this.newPasswordController});

  @override
  _SubmitChangePasswordState createState() => _SubmitChangePasswordState();
}

class _SubmitChangePasswordState extends State<SubmitChangePassword> {
  bool isLoading = false;

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text("موافق"),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  void _submit() async {
    if (widget.formKey.currentState.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        final userId = Provider.of<AuthProvider>(context, listen: false).loggedinUser.userId;
        final oldPassword = widget.oldPasswordController.text;
        final newPassword = widget.newPasswordController.text;
        await Provider.of<AuthProvider>(context, listen: false).setPassword(userId, oldPassword, newPassword);
        widget.oldPasswordController.clear();
        widget.newPasswordController.clear();
        setState(() {
          isLoading = false;
        });
        _showMessage("تم تغيير كلمة المرور بنجاح");
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        final error = e.toString().split(":")[1].replaceAll(" ", "");
        if (error == "INCORRECT_PASSWORD") {
          _showMessage("كلمة المرور الحالية غير صحيحة");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              height: 50.0,
              color: Colors.blue[200],
              child: FlatButton(
                onPressed: _submit,
                child: Center(
                  child: Text('استعادة', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          );
  }
}
