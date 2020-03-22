import 'package:flutter/material.dart';


class EditProductPrice extends StatelessWidget {
  final TextEditingController controller;

  EditProductPrice({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        icon: Icon(Icons.attach_money, color: Colors.blue[200]),
        hintText: 'السعر',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
