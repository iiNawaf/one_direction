import 'package:flutter/material.dart';
import 'package:project/app_drawer/drawer.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:project/screens/home/home.dart';
import 'package:project/screens/offers_list/offers_list.dart';
import 'package:project/widgets/search/search_bar.dart';
import 'package:provider/provider.dart';

class AppManager extends StatefulWidget {
  @override
  _AppManagerState createState() => _AppManagerState();
}

class _AppManagerState extends State<AppManager> {
  final style = TextStyle(fontSize: 13);
  bool isLoading = false;
  bool isInit = true;

  @override
  void didChangeDependencies() async {
    if (isInit) {
      try {
        isInit = false;
        final discountProvider = Provider.of<DiscountProvider>(context, listen: false);
        await discountProvider.loadDiscountedOffers();
      } catch (e) {
        print(e);
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final discountProvider = Provider.of<DiscountProvider>(context);
    final restaurantList = discountProvider.getCategoryProducts("مطعم");
    final coffeeShopsList = discountProvider.getCategoryProducts("كافيه");
    final electronicShopsList = discountProvider.getCategoryProducts("إلكترونيات");
    final retailsShopsList = discountProvider.getCategoryProducts("أسواق");

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
                        padding: EdgeInsets.only(right: 10.0, left: 10.0),
                        color: Colors.white,
                        child: Form(
                          child: Row(
                            children: <Widget>[SearchBar(), Icon(Icons.search, color: Colors.black, size: 20)],
                          ),
                        )),
                  ),
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
                OffersListScreen(list: restaurantList),
                OffersListScreen(list: coffeeShopsList),
                OffersListScreen(list: electronicShopsList),
                OffersListScreen(list: retailsShopsList),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
