import 'package:flutter/material.dart';


class SearchFilter extends StatelessWidget {
  List<String> cities = [
    'الرياض',
    'الطائف',
    'جدة',
    'الدمام',
    'المدينة المنورة',
    'مكة المكرمة',
    'أبها',
    'عرعر',
    'الاحساء',
    'نجران',
    'الخبر',
    'الخرج',
    'حائل'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text('${cities[index]}'),
                onTap: (){},
              );
            },
          ),
        ),


        InkWell(
          onTap: (){},
          child: Container(
            height: 50,
            color: Colors.blue[200],
            child: Center(
              child: Text('بحث'),
            ),
          ),
        )
      ],
    );
  }
}
