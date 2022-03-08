// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

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

class CounterDataModel {
  int id;
  String name;
  String description;
  String price;
  String image;
  String tagLine;
  Color backgroundColor;

  CounterDataModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.tagLine,
    required this.backgroundColor,
  });
}

List<CounterDataModel> countersData = [
  CounterDataModel(
    id: 1,
    name: "African Sun",
    description: "Consumer Staples",
    price: '100.02',
    image: 'assets/images/customer_service.png',
    tagLine: "Part Time",
    backgroundColor: Colors.white,
  ),
  CounterDataModel(
    id: 2,
    name: "OMTT",
    description: "Consumer Staples",
    price: '100.02',
    image: 'assets/images/customer_service.png',
    tagLine: "Part Time",
    backgroundColor: Colors.white,
  ),
  CounterDataModel(
    id: 2,
    name: "ZB",
    description: "Consumer Staples",
    price: '100.02',
    image: 'assets/images/customer_service.png',
    tagLine: "Part Time",
    backgroundColor: Colors.white,
  ),
];

// NEXT

class Product {
  final int id, price;
  final String title, description, image;

  Product(
      {required this.id,
      required this.price,
      required this.title,
      required this.description,
      required this.image});
}

// list of products
// for our demo
List<Product> products = [
  Product(
    id: 1,
    price: 56,
    title: "Classic Leather Arm Chair",
    image: "assets/images/customer_service.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 4,
    price: 68,
    title: "Poppy Plastic Tub Chair",
    image: "assets/images/customer_service.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 9,
    price: 39,
    title: "Bar Stool Chair",
    image: "assets/images/customer_service.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 10,
    price: 39,
    title: "Bar Stool Chair",
    image: "assets/images/customer_service.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
  Product(
    id: 11,
    price: 39,
    title: "Bar Stool Chair",
    image: "assets/images/customer_service.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim",
  ),
];
