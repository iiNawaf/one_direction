import 'package:flutter/material.dart';
import 'package:project/widgets/search_result/search_result_list.dart';


class SearchResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        title: Text('نتائج البحث'),
      ),
      body: ListView(
        children: <Widget>[
         SearchResultList(),
        ],
      ),
    );
  }
}
