import 'package:film_fusion/constants/app_colors.dart';
import 'package:film_fusion/screens/favorites_screen.dart';
import 'package:film_fusion/screens/more_screen.dart';
import 'package:film_fusion/screens/vod_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'dart:io';


class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final pages = [
    VodScreen(),
    FavoritesScreen(),
    MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    double buttomPadding = Platform.isIOS ? 20 : 10 ;
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      extendBody: true,
      body: pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        child: Container(
          color: AppColors.lightGrey,
          padding: EdgeInsets.only(left: 10, right: 10),
          margin: EdgeInsets.only(bottom: 0),
          child: Padding(
            padding:
                 EdgeInsets.only(left: 5, right: 5, top: 10, bottom: buttomPadding ),
            child: GNav(
              rippleColor: AppColors.darkBlue,
              hoverColor: AppColors.white,
              gap: 8,
              activeColor: AppColors.lightGreen,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: AppColors.darkBlue,
              color: Colors.white,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favorites',
                ),
                GButton(
                  icon: Icons.info,
                  text: 'More',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
