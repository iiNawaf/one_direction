import 'package:flutter/material.dart';


class SearchResult extends StatelessWidget {
  List listResult;
  SearchResult({this.listResult});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 13/20,
        crossAxisCount: 2,
      ),
      itemCount: listResult.length,
      itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text("0" + "%",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
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
                        child: Text(
                            '${listResult[index]}'.toString(),
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)
                        ),
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
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
