import 'package:flutter/material.dart';


class MyOffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('العروض'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.pushNamed(context, '/addProductOffers');
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('Product'),
              subtitle: Text('50%'),
            ),
          )
        ],
      )
    );
  }
}
