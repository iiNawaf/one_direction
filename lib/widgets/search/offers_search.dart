import 'package:flutter/material.dart';
import 'package:project/models/offer_model.dart';
import 'package:project/providers/offers_provider.dart';
import 'package:project/widgets/search/search_result.dart';
import 'package:provider/provider.dart';


class OffersSearch extends SearchDelegate<String>{
  List list = [
    "جزمة",
    "قهوة",
    "بيض",
    "منتج غريب",
    "وليد",
    "سبوكة",
    "شوق كلبة الكوارية"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      )
    ];

  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: (){
          close(context, null);
        }
    );

  }

  @override
  Widget buildResults(BuildContext context) {
    final listResult = list.where((element) => element.contains(query)).toList();
    return query.isEmpty
        ? Container()
        : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 13/20,
          crossAxisCount: 2,
        ),
        itemCount: listResult.length,
        itemBuilder: (BuildContext context, int index){
          return SearchResult(listResult: listResult[index]);
        }
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

}