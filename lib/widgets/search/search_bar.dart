import 'package:flutter/material.dart';


class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextFormField(
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'ابحث عن منتج...',
            hintStyle: TextStyle(fontSize: 13)
          ),
        )
    );
  }
}
