// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

import 'data/shared_preference/shared_preference_manager.dart';

class Initialize extends StatefulWidget {
  const Initialize({Key? key}) : super(key: key);

  @override
  State<Initialize> createState() => _InitializeState();
}

class _InitializeState extends State<Initialize> {

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {

    SharedPreferenceManager sharedPreferenceManager = SharedPreferenceManager();

    var showWelcome = await sharedPreferenceManager.getShownWelcomeSlides();
    var accessToken = await sharedPreferenceManager.getAccessToken();

    if (showWelcome == null) {
      // await sharedPreferenceManager.setShownWelcomeSlides(true);
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      });
    }

    else if (accessToken != null) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/home');
      });
    }

    else {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/login');
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: darkGreyBlue,
            strokeWidth: 3.0,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Initializing...",
            style: TextStyle(
              color: darkGreyBlue,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      )),
    );
  }
}
