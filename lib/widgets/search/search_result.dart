import 'package:flutter/material.dart';


class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text("0" + "%",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text("انتهى العرض",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            Expanded(flex: 3, child: Image.asset('./assets/shoes.jpeg', height: 50.0)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Potato", style: TextStyle(fontSize: 12)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("25" + 'ر.س.', style: TextStyle(decoration: TextDecoration.lineThrough)),
                  Text("15"+ 'ر.س.', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            InkWell(
              onTap: () {

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
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
