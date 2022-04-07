// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';


class MarqueeItem extends StatelessWidget {
  const MarqueeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('NMB.ZW', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13.0),),
        SizedBox(width: 5.0),
        Text("12.05", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.0,),),
        SizedBox(width: 5.0),
        Icon(Icons.arrow_upward, color: Color(0xFF8BF168), size: 12.0, ),
        SizedBox(width: 5.0),
        Icon(Icons.arrow_downward, color: Color(0xFFF36060), size: 12.0,),
        SizedBox(width: 5.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
          color: Colors.green,
          child: Text("+0.01", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.0,),),
        ),
        SizedBox(width: 5.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
          color: Colors.red,
          child: Text("+0.01", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.0,),),
        ),
        SizedBox(width: 30.0),
      ],
    );
  }
}
