// ignore_for_file: prefer_const_constructors
import '../data/constants/theme_colors.dart';
import '../theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCategoryCard extends StatelessWidget {
  List menu;
  CustomCategoryCard({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(menu.length, (index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              height: size.width * .25,
              width: size.width * .25,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: textWhite,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: textBlack.withOpacity(0.05),
                    blurRadius: 15.0,
                    offset: Offset(0, 7),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 35.0,
                    width: 35.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: blueColor2,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: const [
                        BoxShadow(
                          color: blueColor2,
                          spreadRadius: 0.0,
                          blurRadius: 6.0,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Container(
                      child: Icon(
                        menu[index]['icon'],
                        color: textWhite,
                        size: 20.0,
                      ),
                    ),
                    // child: Container(
                    //   child: SvgPicture.asset(
                    //     menu[index]['icon'],
                    //     color: textWhite,
                    //     width: 15.0,
                    //   ),
                    // ),
                    //
                  ),
                  Text(
                    menu[index]['title'],
                    style: TextStyle(
                      color: secondary,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 0.0),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
