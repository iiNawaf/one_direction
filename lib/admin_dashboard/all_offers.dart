import 'package:flutter/material.dart';

class AllOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text('Existing Offers',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Card(
              child: Container(
                height: 130,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text('Cheese burger'),
                      subtitle: Text('Burger Station'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            child: Icon(Icons.done, color: Colors.green),
                            onTap: (){

                            },
                          ),
                          InkWell(
                            child: Icon(Icons.close, color: Colors.red),
                            onTap: (){

                            },
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text('السعر: '),
                          Text('من '),
                          Text('20.99', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough)),
                          Text(' إلى '),
                          Text('10.99', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(' ر.س ')
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text('ينتهي العرض يوم ', style: TextStyle(fontSize: 14)),
                          Text('20-3-2020', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),


                  ],
                )

              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Text('Expired Offers',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,)),
            ],
          ),
        ),
        ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            Card(
              child: ListTile(
                leading: CircleAvatar(),
                title: Text('Cheese burger'),
                subtitle: Text('Burger Station'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
