import 'package:flutter/material.dart';
import 'package:travel_app/Screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('الرحلات', Icons.card_travel, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('الفلترة', Icons.filter_list, () {
            Navigator.of(context)
                .pushReplacementNamed(FilterScreen.screenRoute);
          }),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, Function onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'SF', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: () => onTapLink(),
    );
  }
}
