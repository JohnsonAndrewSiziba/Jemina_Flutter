// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jemina_capital/views/home/stats/components/body.dart';

import '../../../data/constants/theme_colors.dart';
import '../../../widgets/go_to_profile.dart';
import '../shared/build_main_page_app_bar.dart';

class StatsPage extends StatefulWidget {
  VoidCallback onOpenMenu;
  double state;
  StatsPage({Key? key, required this.onOpenMenu, required this.state})
      : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  static Color primaryColor = techBlue;
  static Color secondaryColor = complement;
  bool _isIncome = false;

  void onOpenMenu() {
    widget.onOpenMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brightGrey,
      appBar: buildMainPageAppBar(context, onOpenMenu, "Market Statistics"),
      body: StatsBody(),
    );
  }

}
