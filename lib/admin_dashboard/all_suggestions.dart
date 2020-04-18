import 'package:flutter/material.dart';


class AllSuggestions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text('عنوان الاقتراح'),
            subtitle: Text('الوصف'),
          ),
        )
      ],
    );
  }
}
