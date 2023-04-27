import 'package:flutter/material.dart';
import 'package:travel_app/Models/trip.dart';
import 'package:travel_app/Screens/categories_screen.dart';
import 'package:travel_app/Screens/favorites_screen.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({super.key});

  final List<Trip> favoritTrips;
  TabsScreen(this.favoritTrips);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // underscore make the method privet within the class
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenindex = index;
    });
  }

  int _selectedScreenindex = 0;

  late List<Map<String, dynamic>> _screens;

  @override
  void initState() {
    _screens = [
    {'Screen': CategoriesScreen(), 'Title': 'تصنيفات الرحلات'},
    {'Screen': FavoritesScreen(widget.favoritTrips), 'Title': 'الرحلات المفضلة'},
    // CategoriesScreen(),
    // FavoritesScreen(),
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_screens[_selectedScreenindex]['Title'])),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenindex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}

















// import 'package:flutter/material.dart';
// import 'package:travel_app/Screens/categories_screen.dart';

// import 'favorites_screen.dart';

// class TabsScreen extends StatelessWidget {
//   const TabsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('دليل سياحي'), 
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.dashboard),
//                 text: 'التصنيفات',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'المفضلة',
//               ),
//             ],
//           ),
//           ),
//           body: TabBarView(
//             children: [
//               CategoriesScreen(),
//               FavoritesScreen(),
//           ]
//           ),
//       ),
//     );
//   }
// }