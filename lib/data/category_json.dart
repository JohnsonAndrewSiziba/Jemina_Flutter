import 'package:flutter/material.dart';

import '../views/home/account/account_page.dart';
import '../views/home/account/profile/profile.dart';
import '../views/home/account/wallet/wallet.dart';
import '../views/orders/orders.dart';
import '../views/portfolio/portfolio.dart';
import '../views/settings/settings_page.dart';
import '../views/trading/trading_home.dart';
import 'category_list_json.dart';

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