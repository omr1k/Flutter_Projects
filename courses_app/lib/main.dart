import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Courses App",
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 36,
          right: 36,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/intro.svg'),
              Text("Find Your Favorite Course", style: GoogleFonts.poppins(fontSize: 24, color: Color(0xff232323))),
              Padding(
                padding: const EdgeInsets.only(top: 9),
                child: Text('Lorem ipsum dolor sit amet, consetetur \n sadipscing elitr, sed diam nonumy\n eirmod tempor invidunt ut labore et dolore', style: GoogleFonts.poppins(color: Colors.indigo, fontSize: 14),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 129),
                child: GestureDetector(
                  onTap: (){
                    
                  },
                  child: Container(
                    height: 56,
                    width: 315,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff6CC4EE),
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: Text('Get Started', style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}