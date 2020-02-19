import 'package:flutter/material.dart';


class SearchResultList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Product title'),
        subtitle: Text('150' + ' ر.س'),
      ),
    );
  }
}
