// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/data/data.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightSteel,
      appBar: AppBar(
        backgroundColor: brightGrey,
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: darkGreyBlue,
        ),
        title: Text(
          "Contact Us",
          style: TextStyle(color: darkGreyBlue),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.0),
              Center(
                child: Image.asset(
                  "assets/images/contactus.png",
                  height: 250.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Have an issue or query? \n Please get in touch.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: scaffoldBackgroundColor.withOpacity(0.9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            offset: Offset(0, 5.0),
                          ),
                        ],
                      ),
                      height: 150.0,
                      width: 150.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.alternate_email,
                            color: techBlue,
                            size: 50.0,
                          ),
                          Text(
                            "Write to us: ",
                            style: TextStyle(color: techBlue),
                          ),
                          Text("info@jemina.capital"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: scaffoldBackgroundColor.withOpacity(0.9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            offset: Offset(0, 5.0),
                          ),
                        ],
                      ),
                      height: 150.0,
                      width: 150.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone_enabled,
                            color: techBlue,
                            size: 50.0,
                          ),
                          Text(
                            "Call Us: ",
                            style: TextStyle(color: techBlue),
                          ),
                          Text("+263 7843 10119"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: scaffoldBackgroundColor.withOpacity(0.9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            offset: Offset(0, 5.0),
                          ),
                        ],
                      ),
                      height: 150.0,
                      width: 150.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.whatsapp_sharp,
                            color: techBlue,
                            size: 50.0,
                          ),
                          Text(
                            "Chat with us",
                            style: TextStyle(color: techBlue),
                          ),
                          Text(
                            "+263 7843 10119",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: scaffoldBackgroundColor.withOpacity(0.9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                            offset: Offset(0, 5.0),
                          ),
                        ],
                      ),
                      height: 150.0,
                      width: 150.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: techBlue,
                            size: 50.0,
                          ),
                          Text(
                            "Visit us",
                            style: TextStyle(color: techBlue),
                          ),
                          Text(
                            "9 Coull Drive, Mt Pleasant, Hre",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Copyright (c) 2022, Jemina Capital"),
              Text("All Rights Reserved"),
              SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
