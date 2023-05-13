import 'package:film_fusion/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/movie_notifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'PoppinsFont',
          // other theme properties
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => TabsScreen(),
          // '/movieScreen': (context) => movieScreen(),
        },
      ),
    );
  }
}
// static const screenRoute = '/rout-trips';