// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/models/top_marquee_price.dart';


class MarqueeItem extends StatelessWidget {
  TopMarqueePrice topMarqueePrice;
  MarqueeItem({Key? key, required  this.topMarqueePrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(topMarqueePrice.symbol, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13.0),),
        SizedBox(width: 5.0),
        Text(topMarqueePrice.price.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.0,),),
        SizedBox(width: 5.0),
        getIcon(topMarqueePrice.percentageChange),
        SizedBox(width: 5.0),
        getPriceChanges(topMarqueePrice.change, topMarqueePrice.percentageChange),
        SizedBox(width: 30.0),
      ],
    );
  }

  Widget getIcon(num percentageChange) {
    if(percentageChange > 0){
      return Icon(Icons.arrow_upward, color: Color(0xFF8BF168), size: 12.0, );
    }

    else if (percentageChange < 0){
      return Icon(Icons.arrow_downward, color: Color(0xFFF36060), size: 12.0,);
    }
    else{
      return SizedBox(width: 0.0);
    }
  }

  getPriceChanges(num change, num percentageChange) {
    if(percentageChange > 0){
      return Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
            // color: Colors.green,
            color: positiveColor,
            child: Text(change.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.0,),),
          ),
          SizedBox(width: 5.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
            // color: Colors.green,
            color: positiveColor,
            child: Text("$percentageChange%", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.0,),),
          ),
        ],
      );
    }

    else if (percentageChange < 0){
      return Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
            // color: Colors.red,
            color: negativeColor,
            child: Text(change.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.0,),),
          ),
          SizedBox(width: 5.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
            // color: Colors.red,
            color: negativeColor,
            child: Text("$percentageChange%", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.0,),),
          ),
        ],
      );
    }
    else{
      return Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
            color: Colors.white70,
            child: Text(change.toString(), style: TextStyle(color: darkGreyBlue, fontWeight: FontWeight.w400, fontSize: 12.0,),),
          ),
          SizedBox(width: 5.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
            color: Colors.white70,
            child: Text("$percentageChange%", style: TextStyle(color: darkGreyBlue, fontWeight: FontWeight.w400, fontSize: 12.0,),),
          ),
        ],
      );
    }
  }
}
