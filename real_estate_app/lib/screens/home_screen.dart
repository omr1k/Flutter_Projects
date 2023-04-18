import 'package:flutter/material.dart';
import 'package:real_estate_app/const.dart';
import 'package:real_estate_app/responsive.dart';
import 'package:real_estate_app/widgets/menu/side_menu_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.mainSection});
  final Widget mainSection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: kBgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
              ),
            ),
      drawer: SideMenuSction(),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: double.infinity),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  Expanded(flex: 2, child: SideMenuSction()),
                  SizedBox(width: kDefaultPadding,),
                Expanded(
                  flex: 7,
                  child: mainSection,
                ),
                SizedBox(width: kDefaultPadding,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
