import 'package:flutter/material.dart';
import 'package:project/widgets/login/login_password.dart';
import 'package:project/widgets/login/login_username.dart';
import 'package:project/widgets/login/submit_login.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xffe8f0f2),
      body: ListView(
        shrinkWrap: true,
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
            child: Text('تسجيل الدخول', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  LoginUsername(controller: usernameController),
                  Container(height: 20),
                  LoginPassword(controller: passwordController),
                  Container(height: 35),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: SubmitLogin(
                          formKey: formKey,
                          scaffoldKey: scaffoldKey,
                          usernameController: usernameController,
                          passwordController: passwordController,
                        ),
                      ),
                      FlatButton(
                          onPressed:()=> Navigator.pushNamed(context, '/forgotPassword'),
                          child: Text('نسيت كلمة المرور؟',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue[200],
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          new Container(
            height: 50.0,
            color: Colors.blue[200],
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signUp');
              },
              child: Center(
                child: Text('تسجيل حساب جديد', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
