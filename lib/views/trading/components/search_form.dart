// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        style: TextStyle(
          color: darkGreyBlue,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          hintText: 'Search counter...',
          filled: true,
          fillColor: Colors.white,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,

          hintStyle: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.filter_list,
              color: darkGreyBlue,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: tdefaultPadding / 2,
              vertical: tdefaultPadding / 2,
            ),
            child: SizedBox(
              height: 48.0,
              width: 48.0,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20.0,
                ),
                style: ElevatedButton.styleFrom(
                  primary: darkGreyBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(tdefaultBorderRadius),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(tdefaultBorderRadius),
  ),
  borderSide: BorderSide.none,
);