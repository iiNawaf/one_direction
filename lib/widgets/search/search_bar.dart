import 'package:flutter/material.dart';
import 'package:project/widgets/search/offers_search.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          showSearch(context: context, delegate: OffersSearch());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: Colors.white,
          child: Center(
            child: Text('ابحث...', style: TextStyle(color: Colors.grey, fontSize: 14)),
          ),
        ),
      ),
    );
  }
}
