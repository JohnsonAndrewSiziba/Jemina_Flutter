// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome"),
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Email"),
            ),
            SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                color: Color(0XFFEFF3F6),
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    offset: Offset(6, 2),
                    blurRadius: 6.0,
                    spreadRadius: 3.0,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                    offset: Offset(-6, -2),
                    blurRadius: 6.0,
                    spreadRadius: 3.0,
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email Address",
                  contentPadding: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 20.0,
                    bottom: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Password"),
            ),
            SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                color: Color(0XFFEFF3F6),
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    offset: Offset(6, 2),
                    blurRadius: 6.0,
                    spreadRadius: 3.0,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                    offset: Offset(-6, -2),
                    blurRadius: 6.0,
                    spreadRadius: 3.0,
                  ),
                ],
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "********",
                  contentPadding: EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 20.0,
                    bottom: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Forgot password?"),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(13.0),
                    child: Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      // color: Color(0XFF2596be),
                      color: Color(0XFF2596be),
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0XFF2596be),
                          offset: Offset(6, 2),
                          blurRadius: 1.0,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(
                  width: 20.0,
                ),
                InkWell(
                  // onTap: () {
                  //   Navigator.pushNamed(context, '/register');
                  // },
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Color(0XFF2596be),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
