import 'package:flutter/material.dart';
import 'package:jemina_capital/data/data.dart';
import 'package:jemina_capital/mockups/amazing_ui.dart';
import 'package:jemina_capital/views/auth/login.dart';
import 'package:jemina_capital/views/auth/register.dart';
import 'package:jemina_capital/views/contact/contact.dart';
import 'package:jemina_capital/views/onboarding/onboarding.dart';

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
      home: const MyHomePage(title: 'Jemina Capital'),

      //routes
      initialRoute: '/',
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/contact': (context) => const Contact(),
        '/onboarding': (context) => const Onboarding(),

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
