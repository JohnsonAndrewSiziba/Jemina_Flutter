// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/mockups/amazing_ui.dart';
import 'package:jemina_capital/mockups/sidenav_design.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Jemina Capital',
      theme: ThemeData(
        fontFamily: 'Circular',
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0XFFEFF3F6),

        // more
        visualDensity: VisualDensity.adaptivePlatformDensity,

        // theme data

        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30,
            color: Colors.black87,
          ),
          headline2: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Colors.grey,
          ),
          headline4: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Colors.black,
          ),
          headline5: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: 15,
          ),
          caption: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.grey,
            fontSize: 13,
          ),
          button: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),

        // end theme data
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
        nextScreen: Onboarding(),
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
        '/sidenav-design': (context) => const SidenavDesign(),

        //mockups
        '/amazing-ui': (context) => const AmazingUI(),
      },
    );
  }
}
