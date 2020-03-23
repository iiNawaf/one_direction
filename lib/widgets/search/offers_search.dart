import 'package:flutter/material.dart';
import 'package:project/widgets/search/search_result.dart';


class OffersSearch extends SearchDelegate<String>{
  List<String> list = [
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
    return Container();

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List listResult = list.where((element) => element.contains(query)).toList();
    return query.isEmpty
        ? Container()
        : SearchResult(listResult: listResult);
  }

}