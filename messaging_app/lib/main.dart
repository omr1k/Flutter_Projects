import 'package:flutter/material.dart';
import 'package:messaging_app/screens/chat_screen.dart';
import 'package:messaging_app/screens/registration_screen.dart';
import 'package:messaging_app/screens/signin_screen.dart';
import 'package:messaging_app/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  final _auth = FirebaseAuth.instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mesage App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: ChatScreen(),
      initialRoute: _auth.currentUser != null ? ChatScreen.screenRoute : WelcomeScreen.screenRoute,
      routes: {
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        SigninScreen.screenRoute: (context) => SigninScreen(),
        RegistrationScreen.screenRoute: (context) => RegistrationScreen(),
        ChatScreen.screenRoute: (context) => ChatScreen(),
      },
    );
  }
}
