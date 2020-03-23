import 'package:flutter/material.dart';
import 'package:project/models/discounted_product_model.dart';

class SearchResultScreen extends StatelessWidget {
  final List<DiscountedProduct> list;

  SearchResultScreen({@required this.list});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        title: Text('نتائج البحث'),
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}
