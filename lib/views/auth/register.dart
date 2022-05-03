// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/controllers/auth/auth_controller.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/data/shared_preference/shared_preference_manager.dart';
import 'package:jemina_capital/library/request_response.dart';
import 'package:jemina_capital/views/auth/terms_of_service.dart';

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
      backgroundColor: kPrimaryColorLight,
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
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  height: 60.0,
                  child: TextField(
                    autocorrect: false,
                    textCapitalization: TextCapitalization.words,
                    controller: nameController,
                    style: TextStyle(
                      color: darkGreyBlue,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(Icons.person, color: blueColor3),
                      hintText: "Enter Your Full Name",
                      hintStyle: kHintTextStyle,
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsOfService(),
                        ),
                      );
                    },
                    child: Text("By clicking SUBMIT, you agree to our Terms of Service and Privacy Policy",
                      style: TextStyle(
                        color: blueColor3,
                        fontFamily: 'OpenSans',
                        fontSize: 12.0,
                      ),
                    ),
                  ),
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
