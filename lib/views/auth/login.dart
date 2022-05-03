// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../data/shared_preference/shared_preference_manager.dart';
import '../../library/request_response.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SharedPreferenceManager prefsManager = SharedPreferenceManager();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColorLight,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height / 8),
              SizedBox(
                height: 55.0,
              ),
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
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 60.0,
                child: TextField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  obscureText: false,
                  style: TextStyle(
                    color: darkGreyBlue,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(Icons.email, color: blueColor3),
                    hintText: "Enter Your Email",
                    hintStyle: kHintTextStyle,
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
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyle,
                height: 60.0,
                child: TextField(
                  obscureText: true,
                  autocorrect: false,
                  controller: passwordController,
                  style: TextStyle(
                    color: darkGreyBlue,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(Icons.lock, color: blueColor3),
                    hintText: "Enter Your Password",
                    hintStyle: kHintTextStyle,
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
                      padding: EdgeInsets.symmetric(vertical: 0.0),
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 5.0,
                        onPressed: () async {
                          if (loading == true) {
                            return;
                          }
                          setState(() {
                            loading = true;
                          });
                          // print("Email: " + );
                          AuthController authController = AuthController();
                          RequestResponse requestResponse =
                          await authController.login(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          setState(() {
                            loading = false;
                          });

                          var jsonBody = requestResponse.getJsonBody();

                          String message;

                          if (jsonBody['message'] == 'failed validation') {
                            message = jsonBody['errors']
                            [jsonBody['errors'].keys.toList()[0]][0]
                                .toString();
                          } else {
                            message = jsonBody['message'];
                          }

                          if (jsonBody['success'] == false) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(
                                  'Authentication Error',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
                                    color: techBlue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                content: Text(message),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            var token = jsonBody['token'];
                            prefsManager.setAccessToken(token);
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        padding: EdgeInsets.all(15.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: blueColor3,
                        child: buttonContent(),
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
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color: blueColor3,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonContent() {
    if (loading) {
      return Container(
        height: 20.0,
        width: 20.0,
        child: CircularProgressIndicator(
          color: kPrimaryColorLight,
        ),
      );
    }
    return Text(
      "SUBMIT",
      style: TextStyle(
        color: kPrimaryColorLight,
        letterSpacing: 1.5,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        fontFamily: "OpenSans",
      ),
    );
  }
}
