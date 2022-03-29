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
  SharedPreferenceManager prefsManager =  SharedPreferenceManager();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightBackground,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height / 8),
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
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  obscureText: false,
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
                  autocorrect: false,
                  controller: passwordController,
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
                    child: GestureDetector(
                      onTap: () async {
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

                        if(jsonBody['message'] == 'failed validation'){
                          message = jsonBody['errors']
                          [jsonBody['errors'].keys.toList()[0]][0]
                              .toString();
                        }
                        else {
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
                                  onPressed: () =>
                                      Navigator.pop(context, 'OK'),
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
                          color: techBlue,
                          borderRadius: BorderRadius.circular(100.0),
                          boxShadow: [
                            BoxShadow(
                              color: techBlue,
                              offset: Offset(6, 2),
                              blurRadius: 1.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
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
                          color: techBlue,
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
}
