import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/models/discounted_product_model.dart';
import 'package:project/providers/discount_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AllOffers extends StatefulWidget {
  @override
  _AllOffersState createState() => _AllOffersState();
}

class _AllOffersState extends State<AllOffers> {
  List<DiscountedProduct> offeringList = [];
  List<DiscountedProduct> waitingOffers = [];
  List<DiscountedProduct> expiredOffers = [];
  bool isLoading = false;
  bool isInit = true;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (isInit) {
      isInit = false;
      expiredOffers.clear();
      waitingOffers.clear();
      try {
        setState(() {
          isLoading = true;
        });
        await Provider.of<DiscountProvider>(context, listen: false).loadDiscountedOffers();
        Provider.of<DiscountProvider>(context, listen: false).discountedProductsList.forEach((element) => offeringList.add(element));
        Provider.of<DiscountProvider>(context, listen: false).discountedProductsList.clear();
        await Provider.of<DiscountProvider>(context, listen: false).loadDiscountedOffers(mode: 'admin');
        waitingOffers = Provider.of<DiscountProvider>(context, listen: false).discountedProductsList;
        offeringList.forEach((element) {
          if (element.endDate.isBefore(DateTime.now())) {
            expiredOffers.add(element);
          }
        });
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        print(e);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void updateDiscountStatus(int prodcutId, String action, {bool deleteExpired}) async {
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.post(
        "https://one-direction-app.000webhostapp.com/index.php/admin/approve-discount",
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'productId': prodcutId,
          'approval': action,
        }),
      );
      final extractedResponse = json.decode(response.body);
      if (extractedResponse['error'] != null) {
        setState(() {
          isLoading = true;
        });
        print("${extractedResponse['error']}: ${extractedResponse['details']}");
      } else {
        setState(() {
          isLoading = false;
          if (deleteExpired) {
            expiredOffers.removeWhere((element) => element.productId == prodcutId);
            offeringList.removeWhere((element) => element.productId == prodcutId);
          } else {
            waitingOffers.removeWhere((element) => element.productId == prodcutId);
          }
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[Text('عروض في إنتظار القبول', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))],
                ),
              ),
              waitingOffers == null || waitingOffers.isEmpty
                  ? Center(child: Text("لا توجد عروض"))
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: waitingOffers.length,
                      itemBuilder: (ctx, index) => Card(
                        child: Container(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(waitingOffers[index].productImageUrl),
                                  ),
                                  title: Text('${waitingOffers[index].productName}'),
                                  subtitle: Text('${waitingOffers[index].companyName}'),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      InkWell(
                                        child: Icon(Icons.done, color: Colors.green),
                                        onTap: () => updateDiscountStatus(waitingOffers[index].productId, "approve", deleteExpired: false),
                                      ),
                                      InkWell(
                                        child: Icon(Icons.close, color: Colors.red),
                                        onTap: () => updateDiscountStatus(waitingOffers[index].productId, "reject", deleteExpired: false),
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
                                      Text('${waitingOffers[index].priceBefore}',
                                          style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.lineThrough)),
                                      Text(' إلى '),
                                      Text('${waitingOffers[index].priceAfter}', style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text(' ر.س ')
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text('ينتهي العرض يوم ', style: TextStyle(fontSize: 14)),
                                      Text('${waitingOffers[index].endDate.toString().split(" ")[0]}',
                                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Text('عروض انتهى وقتها',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              expiredOffers == null || expiredOffers.isEmpty
                  ? Center(child: Text("لا توجد عروض"))
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: expiredOffers.length,
                      itemBuilder: (ctx, index) => Card(
                        child: ListTile(
                          leading: CircleAvatar(backgroundImage: NetworkImage(expiredOffers[index].productImageUrl)),
                          title: Text('${expiredOffers[index].productName}'),
                          subtitle: Text('${expiredOffers[index].companyName}'),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => updateDiscountStatus(expiredOffers[index].productId, "reject", deleteExpired: true),
                          ),
                        ),
                      ),
                    )
            ],
          );
  }
}
