// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jemina_capital/theme/colors.dart';
import 'package:jemina_capital/theme/padding.dart';

class CustomHoldingsCard extends StatefulWidget {
  const CustomHoldingsCard({
    Key? key,
    required this.image,
    required this.title,
    required this.instructor,
    required this.videoAmount,
    this.percentage = 0,
  }) : super(key: key);

  final String image;
  final String title;
  final String instructor;
  final String videoAmount;
  final double percentage;

  @override
  _CustomHoldingsCardState createState() => _CustomHoldingsCardState();
}

class _CustomHoldingsCardState extends State<CustomHoldingsCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.width * .3,
      padding: const EdgeInsets.all(15.0),
      margin: EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.width * .13,
            child: Row(
              children: [
                SizedBox(
                  height: size.width * .13,
                  width: size.width * .13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: miniSpacer),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: secondary,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Intructor: ' + widget.instructor,
                            style: TextStyle(
                              fontSize: 11.0,
                              color: grey,
                            ),
                          ),
                          Text(
                            '6/' + widget.videoAmount,
                            style: TextStyle(
                              fontSize: 11.0,
                              color: grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Stack(
                  alignment: Alignment.centerLeft,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: size.width,
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: secondary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    Container(
                      width: widget.percentage * 2.8,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: [
                          BoxShadow(
                            color: primary.withOpacity(0.5),
                            blurRadius: 6.0,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: miniSpacer * 2),
              Container(
                width: 50,
                alignment: Alignment.centerRight,
                child: Text(
                  widget.percentage.toString() + '%',
                  style: TextStyle(
                      fontSize: 13.0,
                      color: primary,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
