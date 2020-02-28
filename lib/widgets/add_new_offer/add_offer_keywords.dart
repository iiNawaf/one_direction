import 'package:flutter/material.dart';


class AddOfferKeywords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 4,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          icon: Icon(Icons.keyboard, color: Colors.blue[200]),
          hintText: 'كلمات مفتاحية',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey
            )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue[200]
              )
          )
      ),
    );
  }
}
