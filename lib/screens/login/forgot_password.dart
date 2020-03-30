import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:project/widgets/login/forgot_password/email.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  String newPassword;
  Color iconColor = Colors.grey;

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
    if (formKey.currentState.validate()) {
      try {
        setState(() {
          isLoading = true;
        });
        final email = emailController.text;
        final fetchNewPassword = await Provider.of<AuthProvider>(context, listen: false).passwordRecover(email);
        setState(() {
          isLoading = false;
          newPassword = fetchNewPassword;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
        });
        print(e);
        final error = e.toString().split(":")[1].replaceAll(" ", "");
        if (error == "EMAIL_NOT_FOUND") {
          _showMessage("البريد الإلكتروني غير مسجل");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      body: newPassword == null
          ? Form(
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
                    child: Text('استعادة كلمة المرور', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 50),
                  Email(controller: emailController),
                  //Submit Button
                  isLoading
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
                        )
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.check_circle, color: Colors.green, size: 70),
                      SizedBox(height: 30),
                      Text(
                        "تمت إستعادة كلمة المرور بنجاح, الرجاء تسجيل الدخول وتغيير كلمة المرور",
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey[300], width: 1)),
                    child: ListTile(
                      leading: Text("كلمة المرور:"),
                      title: SelectableText(newPassword),
                      trailing: IconButton(
                        icon: Icon(Icons.content_copy, color: iconColor),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: newPassword));
                          setState(() {
                            iconColor = Colors.blue;
                          });
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      color: Colors.blue[200],
                      child: Center(
                        child: Text(
                          "تسجيل الدخول",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    onTap: () => Navigator.of(context).pushReplacementNamed("/login"),
                  )
                ],
              ),
            ),
    );
  }
}
