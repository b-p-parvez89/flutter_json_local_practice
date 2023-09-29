// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_json_local_practice/page/card.dart';
import 'package:flutter_json_local_practice/page/favorite.dart';
import 'package:flutter_json_local_practice/page/homepage.dart';
import 'package:flutter_json_local_practice/page/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    HomePage(),
    ShopingCard(),
    FavoritePage(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0 ? Colors.purple : Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: _selectedIndex == 1 ? Colors.purple : Colors.black,
            ),
            label: ' Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _selectedIndex == 2 ? Colors.purple : Colors.black,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 3 ? Colors.purple : Colors.black,
              ),
              label: 'Profile')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}
