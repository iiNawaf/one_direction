import 'package:flutter/material.dart';


class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        setState(() {
          isChecked = !isChecked;
        });
      },
      leading: CircleAvatar(),
      title: Text('Product'),
      trailing: Checkbox(
        activeColor: Colors.blue[200],
          value: isChecked,
          onChanged: (value){
            setState(() {
              isChecked = !isChecked;
            });
          }
      ),
    );
  }
}
