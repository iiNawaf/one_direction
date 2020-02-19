import 'package:flutter/material.dart';

class LatestOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        width: 150.0,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Image.asset('./assets/shoes.jpeg', height: 50.0)
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('حذاء اديداس جديد اللون اسود مقاس 42', style: TextStyle(fontSize: 12)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text('150' + 'ر.س.', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/offerPreview');
              },
              child: Container(
                height: 30.0,
                color: Colors.blue[200],
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.local_offer, size: 18),
                        Text(' الذهاب إلى العرض', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      ],
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
