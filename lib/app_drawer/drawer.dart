import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';
import 'package:project/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final loggedinUser = authProvider.loggedinUser;
    var route = ModalRoute.of(context).settings.name;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                loggedinUser == null
                    ? Container()
                    : loggedinUser.accountType == AccountType.Individual
                        ? Container()
                        : CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(authProvider.userComapny.logoUrl),
                          ),
                loggedinUser == null
                    ? Center(child: Text("مرحبا بك في One Direction"))
                    : authProvider.userComapny == null
                        ? Text("اهلاً بك ${loggedinUser.username}")
                        : Text("اهلاً بك ${authProvider.userComapny.arName}"),
                loggedinUser != null ? loggedinUser.accountType == AccountType.Individual ? Container() : Spacer() : Container(),
                loggedinUser == null
                    ? Container()
                    : GestureDetector(
                        child: Text(
                          "تغيير كلمة المرور",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          route == '/changePassword' ? Navigator.pop(context) : Navigator.pushNamed(context, '/changePassword');
                        },
                      ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('الرئيسية'),
            onTap: () {
              route == '/' ? Navigator.pop(context) : Navigator.pushNamed(context, '/');
            },
          ),
          loggedinUser != null
              ? Container()
              : ListTile(
                  leading: Icon(Icons.person),
                  title: Text('تسجيل الدخول'),
                  onTap: () {
                    route == '/login' ? Navigator.pop(context) : Navigator.pushNamed(context, '/login');
                  },
                ),
          loggedinUser == null
              ? Container()
              : loggedinUser.accountType == AccountType.Company
                  ? Container()
                  : ListTile(
                      leading: Icon(Icons.business),
                      title: Text('ترقية إلى حساب شركة'),
                      onTap: () {
                        route == '/upgradeToCompanyAccount' ? Navigator.pop(context) : Navigator.pushNamed(context, '/upgradeToCompanyAccount');
                      },
                    ),
          loggedinUser == null ? Container() : loggedinUser.accountType == AccountType.Company ? Divider() : Container(),
          loggedinUser == null
              ? Container()
              : loggedinUser.accountType == AccountType.Individual
                  ? Container()
                  : ListTile(
                      leading: Icon(Icons.edit),
                      title: Text('إدارة'),
                      onTap: () {
                        route == '/manage' ? Navigator.pop(context) : Navigator.pushNamed(context, '/manage');
                      },
                    ),
          loggedinUser == null
              ? Container()
              : loggedinUser.accountType == AccountType.Individual
                  ? Container()
                  : ListTile(
                      leading: Icon(Icons.add_circle),
                      title: Text('إضافة منتج'),
                      onTap: () {
                        route == '/addNewProduct' ? Navigator.pop(context) : Navigator.pushNamed(context, '/addNewProduct');
                      },
                    ),
          loggedinUser == null
              ? Container()
              : loggedinUser.accountType == AccountType.Individual
                  ? Container()
                  : ListTile(
                      leading: Icon(Icons.add_circle),
                      title: Text('إضافة عرض'),
                      onTap: () {
                        route == '/addNewOffer' ? Navigator.pop(context) : Navigator.pushNamed(context, '/addNewOffer');
                      },
                    ),
          loggedinUser == null
              ? Container()
              : loggedinUser.accountType == AccountType.Individual
                  ? Container()
                  : ListTile(
                      leading: Icon(Icons.add_circle),
                      title: Text('إضافة خصم'),
                      onTap: () {
                        route == '/myOffers' ? Navigator.pop(context) : Navigator.pushNamed(context, '/myOffers');
                      },
                    ),
          Divider(),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('قيمنا'),
            onTap: () {
              Navigator.pushNamed(context, '/rating');
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('اقتراح'),
            onTap: () {
              Navigator.pushNamed(context, '/suggestions');
            },
          ),
          loggedinUser == null
              ? Container()
              : ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('خروج'),
                  onTap: () async {
                    await authProvider.signout();
                    Navigator.of(context).pop();
                  },
                ),
        ],
      ),
    );
  }
}
