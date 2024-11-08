// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instagram/pages/account.dart';
import 'package:instagram/pages/home.dart';
import 'package:instagram/pages/reel.dart';
import 'package:instagram/pages/search.dart';
import 'package:instagram/pages/shop.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void _navigateBottomNavBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  List<Widget> _list = [
    userHome(unreadMessages: 4,),
    userSearch(),
    userReel(),
    userShop(),
    userAccount(unreadMessages: 9,),
  ];
   

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _list[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _navigateBottomNavBar,
        showSelectedLabels: false,
  showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.video_call),
            label: 'reels',
          ),
           BottomNavigationBarItem(
            icon: const Icon(Icons.shop),
            label: 'shop',
          ),
           BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: 'account',
          ),
        ],
      ),
    );
  }
}