
import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/views/home/landing/components/marquee_item.dart';
import 'package:ticker_text/ticker_text.dart';

class TopMarquee extends StatelessWidget {
  const TopMarquee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            speed: 20,
            startPauseDuration: const Duration(milliseconds: 500),
            endPauseDuration: const Duration(seconds: 2),
            child: Row(
              children: const [
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
                MarqueeItem(),
              ],
            )
        ),
      ),
    );
  }
}
