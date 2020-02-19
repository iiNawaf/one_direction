import 'package:flutter/material.dart';
import 'package:project/app_drawer/drawer.dart';
import 'package:project/screens/home/home.dart';
import 'package:project/screens/offers_list/offers_list.dart';
import 'package:project/widgets/search/search_bar.dart';
import 'package:project/widgets/search/search_filter.dart';

class AppManager extends StatelessWidget {
  final style = TextStyle(fontSize: 13);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Stack(
          children: <Widget>[
            Scaffold(
              backgroundColor: Color(0xffe8f0f2),
              drawer: AppDrawer(),
              appBar: AppBar(
                backgroundColor: Colors.blue[200],
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          height: 30.0,
                          padding: EdgeInsets.only(right:10.0, left: 10.0),
                          color: Colors.white,
                          child: Form(
                            child: Row(
                              children: <Widget>[
                                SearchBar(),
                                Icon(Icons.search, color: Colors.black, size:20)
                              ],
                            ),
                          )
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.filter_list),
                        onPressed: (){
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context){
                                return SearchFilter();
                              }
                          );
                        }
                    )
                  ],
                ),
                bottom: TabBar(
                  labelPadding: EdgeInsets.all(0.0),
                  indicatorColor: Colors.transparent,
                  tabs: [
                    Tab(child: Text('الرئيسية', style: style)),
                    Tab(child: Text('مطاعم', style: style)),
                    Tab(child: Text('كافيهات', style: style)),
                    Tab(child: Text('إلكترونيات', style: style)),
                    Tab(child: Text('أسواق', style: style)),

                  ],
                ),
              ),
              body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  HomeScreen(),
                  OffersListScreen(),
                  OffersListScreen(),
                  OffersListScreen(),
                  OffersListScreen(),
                ],
              ),
            ),
          ],
        )
    );
  }
}
