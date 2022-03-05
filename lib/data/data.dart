// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

/// amazing ui data

Color primaryColor = Color(0xFFCADCED);

List<BoxShadow> customShadow = [
  BoxShadow(
    color: Colors.white.withOpacity(0.2),
    spreadRadius: -2,
    offset: Offset(-5, -5),
    blurRadius: 30,
  ),
  BoxShadow(
    color: Color.fromARGB(255, 13, 60, 161).withOpacity(0.2),
    spreadRadius: 2,
    offset: Offset(7, 7),
    blurRadius: 20,
  ),
];

List transactions = [
  {"transaction": "Wallet Top Up", "amount": 200.0},
  {"transaction": "Wallet Top Up", "amount": 200.0},
  {"transaction": "Wallet Top Up", "amount": 200.0},
  {"transaction": "Wallet Top Up", "amount": 200.0},
  {"transaction": "Wallet Top Up", "amount": 200.0},
  {"transaction": "Wallet Top Up", "amount": 200.0},
];
