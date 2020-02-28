import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('./assets/apple.png'),
                ),
                Text('Company name')
              ],
            ),
          ),


          ListTile(
            leading: Icon(Icons.home),
            title: Text('الرئيسية'),
            onTap: () {
              route == '/'
                  ? Navigator.pop(context)
                  : Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('تسجيل الدخول'),
            onTap: () {
              route == '/login'
                  ? Navigator.pop(context)
                  : Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('ترقية إلى حساب شركة'),
            onTap: () {
              route == '/upgradeToCompanyAccount'
                  ? Navigator.pop(context)
                  : Navigator.pushNamed(context, '/upgradeToCompanyAccount');
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('إضافة منتج'),
            onTap: () {
              route == '/addNewProduct'
                  ? Navigator.pop(context)
                  : Navigator.pushNamed(context, '/addNewProduct');
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('إضافة عرض'),
            onTap: () {
              route == '/addNewOffer'
                  ? Navigator.pop(context)
                  : Navigator.pushNamed(context, '/addNewOffer');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('قيمنا'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('اقتراح'),
            onTap: (){
              Navigator.pushNamed(context, '/suggestions');
            },
          ),
        ],
      ),
    );
  }
}
