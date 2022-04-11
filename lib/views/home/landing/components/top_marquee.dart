
import 'package:flutter/material.dart';
import 'package:jemina_capital/controllers/statistics/price_sheets_controller.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/home/landing/components/marquee_item.dart';
import 'package:skeletons/skeletons.dart';
import 'package:ticker_text/ticker_text.dart';

import '../../../../library/request_response.dart';
import '../../../../models/top_marquee_price.dart';

class TopMarquee extends StatefulWidget {
  const TopMarquee({Key? key}) : super(key: key);

  @override
  State<TopMarquee> createState() => _TopMarqueeState();
}

class _TopMarqueeState extends State<TopMarquee> {
  bool isLoading = true;

  late RequestResponse requestResponse;
  List<TopMarqueePrice> pricesList = [];

  void getMarqueeValues() async {
    PriceSheetsController priceSheetsController = PriceSheetsController();
    requestResponse = await priceSheetsController.getTopMarqueePrices();
    var jsonBody = requestResponse.getJsonBody();

    var jsonNewsList = jsonBody['prices'];

    setState(() {
      pricesList = TopMarqueePrice.jsonDecode(jsonNewsList);
      isLoading = false;
      // print(jsonBody.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    getMarqueeValues();
  }


  @override
  Widget build(BuildContext context) {
    return Skeleton(
      isLoading: isLoading,
      skeleton: const SkeletonLine(),
      child: Container(
        width: double.infinity,
        color: darkGreyBlue,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4.0,
            vertical: 8.0,
          ),
          child: TickerText(
            // controller: tickerTextController, // this is optional
              scrollDirection: Axis.horizontal,
              speed: 40,
              startPauseDuration: const Duration(milliseconds: 500),
              endPauseDuration: const Duration(seconds: 2),
              child: SizedBox(
                height: 18.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: pricesList.length,
                  itemBuilder: (context, index) {
                    return MarqueeItem(
                      topMarqueePrice: pricesList[index],
                    );
                  },
                ),
              ),
          ),
        ),
      ),
    );
  }
}
