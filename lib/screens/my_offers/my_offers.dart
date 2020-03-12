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
            onPressed: () {
              Navigator.pushNamed(context, '/addProductOffers');
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
                leading: Text('50%'),
                title: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (ctx, index) => Container(
                      padding: EdgeInsets.all(5),
                      height: 50,
                      width: 50,
                      child: CircleAvatar(
                        maxRadius: 50,
                        backgroundImage: NetworkImage(
                            "https://cdn.shopify.com/s/files/1/0051/7262/5477/products/1000ml-illuminated-sleeve-2x-new_c44257a2-91c3-4946-b2de-80deb6eb9a14_900x900.png?v=1570045978"),
                      ),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
