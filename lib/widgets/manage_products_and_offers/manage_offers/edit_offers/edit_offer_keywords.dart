import 'package:flutter/material.dart';


class EditOfferKeywords extends StatelessWidget {
  final TextEditingController controller;

  EditOfferKeywords({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: 4,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        icon: Icon(Icons.keyboard, color: Colors.blue[200]),
        hintText: 'كلمات مفتاحية',
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
