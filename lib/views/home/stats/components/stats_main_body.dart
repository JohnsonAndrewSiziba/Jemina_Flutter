import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import '../../../../widgets/card.dart';

class MainBody extends StatelessWidget {
  const MainBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 30,
        itemBuilder: (context, index) {
      return pricesListWidget(context: context);
    });
  }
}


Widget pricesListWidget({required BuildContext context}) {
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
                    "https://jemina.capital/storage/company_logos/company-logo1642428309.png",
                    width: 35.0,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    "ZYMB.ZW",
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: darkGreyBlue, fontFamily: "Roboto",),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_upward, color: Colors.green, size: 16.0,),
                  const Text(
                    "120.00",
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.green, fontFamily: "Roboto",),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Text(
                    "(0.00%)",
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.green, fontFamily: "Roboto",),
                  ),
                  Spacer(),
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
                    children: const [
                      Text("Open:", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.blueGrey, fontFamily: "Roboto",),),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("200", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.blueGrey, fontFamily: "Roboto",),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Close", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.blueGrey, fontFamily: "Roboto",),),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("200", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.blueGrey, fontFamily: "Roboto",),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Volume", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.blueGrey, fontFamily: "Roboto",),),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("200", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.blueGrey, fontFamily: "Roboto",),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("M. Cap.", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.blueGrey, fontFamily: "Roboto",),),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("200", style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400, color: Colors.blueGrey, fontFamily: "Roboto",),),
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