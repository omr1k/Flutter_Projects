import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherProvider.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages;
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'AppFont',
        ),
        home: HomeScreen(),
      ),
    );
  }
}
