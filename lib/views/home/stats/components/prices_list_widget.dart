import 'package:flutter/material.dart';
import 'package:jemina_capital/models/price.dart';

import '../../../../data/constants/api_routes.dart';
import '../../../../data/constants/theme_colors.dart';
import '../../../../widgets/card.dart';

Widget pricesListWidget({required BuildContext context, required Price price}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    Routes.serverHome + (price.logo ?? ""),
                    width: 40.0,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    price.symbol,
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: darkGreyBlue, fontFamily: "Roboto",),
                  ),
                  const Spacer(),
                  getIcon(price.direction),
                  Text(
                    price.close,
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: getPriceColor(price.direction), fontFamily: "Roboto",),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "(${price.percentageChange}%)",
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: getPriceColor(price.direction), fontFamily: "Roboto",),
                  ),
                  // Spacer(),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding + 75.0),
                child: Divider(
                  color: Colors.blueGrey,
                  thickness: 0.1,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Open:", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.blueGrey, fontFamily: "Roboto",),),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(price.open, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.blueGrey, fontFamily: "Roboto",),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Close", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.blueGrey, fontFamily: "Roboto",),),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(price.close, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.blueGrey, fontFamily: "Roboto",),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Volume", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.blueGrey, fontFamily: "Roboto",),),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(price.volume, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.blueGrey, fontFamily: "Roboto",),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("M. Cap. (M)", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.blueGrey, fontFamily: "Roboto",),),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(price.marketCap, style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.blueGrey, fontFamily: "Roboto",),),
                    ],
                  ),

                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}

getPriceColor(String direction) {
  if (direction == "up") {
    return Colors.green;
  } else if(direction == "down") {
    return Colors.red;
  }
  else {
    return Colors.blueGrey;
  }
}

Widget getIcon(String direction){
  if(direction == "up") {
    return const Icon(Icons.arrow_upward, color: Colors.green, size: 14.0,);
  }
  else if(direction == "down") {
    return const Icon(Icons.arrow_downward, color: Colors.red, size: 14.0,);
  }
  else {
    return const SizedBox(
      width: 0.0,
    );
  }
}