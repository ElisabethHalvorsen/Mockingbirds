import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


import './screens/verify_email_screen.dart';
import './screens/auth_screen.dart';
import './screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      // Initialize FlutterFire:
      future: Firebase.initializeApp(), // _initialization,
      builder: (context, appSnapshot) {


      return MaterialApp(
        title: 'Veloplan',
        theme: ThemeData(
          primarySwatch: Colors.green,
          backgroundColor: Colors.white,
          accentColor: Colors.amber,
          accentColorBrightness: Brightness.dark,
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Colors.green,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        home: appSnapshot.connectionState != ConnectionState.done ? const SplashScreen() : StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          if (userSnapshot.hasData) {
            return const VerifyEmailScreen();
          }
          return const AuthScreen();
        }),
      );

    });
  }
=======
import 'screens/login_screen.dart';
import 'navbar.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {'/': (context) => Login(), '/map': (context) => Navbar()},
  ));
>>>>>>> main
}
