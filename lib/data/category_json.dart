import 'package:flutter/material.dart';
import 'package:jemina_capital/views/profile/profile.dart';
import 'package:jemina_capital/views/wallet/wallet.dart';
import '../views/orders/orders.dart';
import '../views/portfolio/portfolio.dart';
import '../views/settings/settings_page.dart';
import '../views/trading/trading_home.dart';

List menuRow1 = [
  {
    'icon': Icons.add_business,
    'title': 'Trading',
    'destination': TradingHome(),
  },
  {
    'icon': Icons.fact_check,
    'title': 'Orders',
    'destination': Orders(),
  },
  {
    'icon': Icons.account_balance,
    'title': 'Wallet',
    'destination': Wallet(),
  },
];

List menuRow2 = [
  {
    'icon': Icons.paid,
    'title': 'Portfolio',
    'destination': Portfolio(),
  },
  {
    'icon': Icons.account_circle,
    'title': 'Profile',
    'destination': Profile(),
  },
  {
    'icon': Icons.settings,
    'title': 'Settings',
    'destination': SettingsPage(),
  },
];
