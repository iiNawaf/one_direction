import 'package:flutter/material.dart';

class SignUpCompanyCategory extends StatefulWidget {
  static String companyCategoryValue = 'اختر';
  @override
  _SignUpCompanyCategoryState createState() => _SignUpCompanyCategoryState();
}

class _SignUpCompanyCategoryState extends State<SignUpCompanyCategory> {
  @override
  void dispose() {
    SignUpCompanyCategory.companyCategoryValue = 'اختر';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.more_horiz, color: Colors.blue[200]),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width,
            child: DropdownButton<String>(
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down),
              value: SignUpCompanyCategory.companyCategoryValue,
              iconSize: 24,
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 1,
                color: Colors.grey,
              ),
              onChanged: (String newValue) {
                setState(() {
                  SignUpCompanyCategory.companyCategoryValue = newValue;
                });
              },
              items: <String>['اختر', 'مطعم', 'كافيه', 'إلكترونيات', 'أسواق'].map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
