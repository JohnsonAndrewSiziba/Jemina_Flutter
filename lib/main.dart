// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/mockups/amazing_ui.dart';
import 'package:jemina_capital/views/auth/login.dart';
import 'package:jemina_capital/views/auth/register.dart';
import 'package:jemina_capital/views/auth/verify_email.dart';
import 'package:jemina_capital/views/contact/contact.dart';
import 'package:jemina_capital/views/home/home.dart';
import 'package:jemina_capital/views/onboarding/onboarding.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:jemina_capital/widgets/sidenav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jemina Capital',
      theme: ThemeData(
        fontFamily: 'Circular',
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0XFFEFF3F6),
        // scaffoldBackgroundColor: primaryColor,
      ),
      // home: const MyHomePage(title: 'Jemina Capital'),

      // splash screen
      home: AnimatedSplashScreen(
        duration: 1, // remove this
        animationDuration: Duration(microseconds: 1), // remove this
        splashIconSize: 200,
        splash: Image.asset(
          'assets/images/logo-no-bg.png',
        ),
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale,
        nextScreen: Home(),
      ),

      //routes
      initialRoute: '/',
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/contact': (context) => const Contact(),
        '/onboarding': (context) => const Onboarding(),
        '/verify-email': (context) => const VerifyEmail(),
        '/sidenav': (context) => const SideNav(),

        //mockups
        '/amazing-ui': (context) => const AmazingUI(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Welcome"),
          ],
        ),
      ),
    );
  }
}
