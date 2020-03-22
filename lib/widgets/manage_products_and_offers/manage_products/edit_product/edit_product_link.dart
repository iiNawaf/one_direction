import 'package:flutter/material.dart';


class EditProductLink extends StatelessWidget {
  final TextEditingController controller;

  EditProductLink({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        icon: Icon(Icons.link, color: Colors.blue[200]),
        hintText: 'رابط الصورة',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[200]),
        ),
      ),
    );
  }
}
