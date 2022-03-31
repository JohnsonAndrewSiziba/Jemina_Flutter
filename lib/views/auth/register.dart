// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/controllers/auth/auth_controller.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/data/shared_preference/shared_preference_manager.dart';
import 'package:jemina_capital/library/request_response.dart';

// var accessToken = await prefsManager.getAccessToken();
// if( accessToken != null){
// print("Tokensssss: " + accessToken);
// }

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SharedPreferenceManager prefsManager = SharedPreferenceManager();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lightBackground,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height / 8),
                Text("Welcome"),
                Text(
                  "Register",
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
                  child: Text("Name"),
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
                    textCapitalization: TextCapitalization.words,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Full Name",
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
                    autocorrect: false,
                    controller: passwordController,
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
                              await authController.register(
                            name: nameController.text,
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
                            Navigator.pushNamed(context, '/verify-email');
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(13.0),
                          child: Center(
                            child: buttonContent(),
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
                    Text("Already have an account?"),
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        "Sign In",
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
      ),
    );
  }

  Widget buttonContent() {
    if (loading) {
      return Container(
        height: 20.0,
        width: 20.0,
        child: CircularProgressIndicator(
          color: complement,
        ),
      );
    }
    return Text(
      "Register",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }
}
