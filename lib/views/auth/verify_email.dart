// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

import '../../controllers/auth/auth_controller.dart';
import '../../library/request_response.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  TextEditingController digit1Controller = TextEditingController();
  TextEditingController digit2Controller = TextEditingController();
  TextEditingController digit3Controller = TextEditingController();
  TextEditingController digit4Controller = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      size: 22,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/logo-no-bg.png',
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Email Verification',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter verification code number sent to email address siziba.uz@outlook.com",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  padding: EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _textFieldOTP(first: true, last: false, controller: digit1Controller),
                          _textFieldOTP(first: false, last: false, controller: digit2Controller),
                          _textFieldOTP(first: false, last: false, controller: digit3Controller),
                          _textFieldOTP(first: false, last: true, controller: digit4Controller),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (loading == true) {
                              return;
                            }
                            setState(() {
                              loading = true;
                            });
                            
                            // Navigator.pushNamed(context, '/home');
                            String emailVerificationCode = digit1Controller.text
                                + digit2Controller.text
                                + digit3Controller.text
                                + digit4Controller.text;

                            AuthController authController = AuthController();

                            RequestResponse requestResponse =
                                await authController.verifyEmail(
                                    verificationCode: emailVerificationCode
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
                                    'Verification Failed',
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
                              Navigator.pushNamed(context, '/home');
                            }

                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              techBlue,
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(14.0),
                            child: buttonContent(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Didn't get a code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: techBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 300.0,
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
      "Verify",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }

  Widget _textFieldOTP({required bool first, last, required TextEditingController controller}) {
    return Container(
      height: 85,
      width: 42.0,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: grayBackground,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: complement,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
      ),
    );
  }
}
