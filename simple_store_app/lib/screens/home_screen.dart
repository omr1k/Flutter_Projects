import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_store_app/widgets/home/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: homeAppBar(),
      body: HomeBody(),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
      elevation: 0,
      // ignore: prefer_const_constructors
      title: Text(
        'مرحبا بكم في المتجر',
        style: GoogleFonts.getFont("Almarai"),
        ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
