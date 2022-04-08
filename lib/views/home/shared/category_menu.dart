import 'package:flutter/material.dart';

import '../../../data/constants/theme_colors.dart';

Widget buildCategoryItem(int index, Function onTap, int selectedIndex, List<IconData> icons, List<String> categories) {
  return GestureDetector(
    onTap: () {
      onTap(index);
    },
    child: Container(
      // height: 40.0,
      decoration: BoxDecoration(
        color: selectedIndex == index ? darkGreyBlue : jeminaGrey,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        children: [
          SizedBox(
            height: 32.0,
            width: 32.0,
            child: Icon(icons[index], color: selectedIndex == index ? Colors.blueGrey[100] : Colors.blueGrey, size: 15.0),
          ),
          const SizedBox(width: 8.0),
          Text(
            categories[index],
            style: TextStyle(
              color: selectedIndex == index ? Colors.blueGrey[100] : Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    ),
  );
}