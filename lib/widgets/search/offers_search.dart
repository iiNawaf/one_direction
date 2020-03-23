import 'package:flutter/material.dart';
import 'package:project/widgets/search/search_result.dart';


class OffersSearch extends SearchDelegate<String>{
  List<String> list = [
    "جزمة",
    "قهوة",
    "بيض",
    "منتج غريب",
    "وليد",
    "سبوكة"
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
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 13/20,
        crossAxisCount: 2,
      ),
      children: <Widget>[
        SearchResult()
      ],
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listResult = list.where((element) => element.contains(query)).toList();
    return query.isEmpty
        ? Container()
        : ListView.builder(
        itemCount: listResult.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            onTap: (){
              showResults(context);
            },
            leading: CircleAvatar(),
            title: Text('${listResult[index]}')
          );
        },

    );
  }

}