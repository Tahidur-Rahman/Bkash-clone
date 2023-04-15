import 'package:bkash/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ITEM CHANGING
  int _selectedIndex = 0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  // FULL BODY
  static const List<Widget> _bottomMenu = <Widget>[
    HomeBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomMenu.elementAt(_selectedIndex),
    );
  }
}