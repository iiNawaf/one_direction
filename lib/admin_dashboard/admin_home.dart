import 'package:flutter/material.dart';
import 'package:project/admin_dashboard/all_offers.dart';
import 'package:project/admin_dashboard/all_suggestions.dart';



class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    AllOffers(),
    AllSuggestions(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8f0f2),
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('Admin Home'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: (){}
          )
        ],
      ),

      body: _widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            title: Text('Offers'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('Suggestions'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[200],
        onTap: _onItemTapped,
      ),
    );
  }
}
