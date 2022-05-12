import 'package:flutter/material.dart';

import '../../../data/constants/theme_colors.dart';
import '../../../widgets/go_to_profile.dart';

AppBar buildMainPageAppBar(BuildContext context, Function onTap, String pageTitle, {bool showProfile = true}) {
  return AppBar(
    centerTitle: true,
    // backgroundColor: jeminaGrey,
    backgroundColor: kPrimaryColorLight1,
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
    actions: [
      showProfile ? GotoProfile() : Container(),
    ],
  );
}