import 'package:flutter/material.dart';


class SuggestionDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 7,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          hintText: 'الوصف',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue[200]
              )
          )
      ),
    );
  }
}
