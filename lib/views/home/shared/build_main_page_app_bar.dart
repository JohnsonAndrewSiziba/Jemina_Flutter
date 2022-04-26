import 'package:flutter/material.dart';

import '../../../data/constants/theme_colors.dart';
import '../../../widgets/go_to_profile.dart';

AppBar buildMainPageAppBar(BuildContext context, Function onTap, String pageTitle) {
  return AppBar(
    centerTitle: true,
    // backgroundColor: jeminaGrey,
    backgroundColor: kPrimaryColorLight,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        onTap();
      },
      icon: Icon(
        Icons.sort,
        color: darkGreyBlue,
      ),
    ),
    title: Text(pageTitle, style: TextStyle(color: darkGreyBlue),),
    actions: const [
      GotoProfile(),
    ],
  );
}