import 'package:flutter/material.dart';
import 'package:jemina_capital/controllers/misc_controller/MiscController.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../data/constants/theme_colors.dart';
import '../../../../library/request_response.dart';
import '../../../../models/quote.dart';

class QuoteComponent extends StatefulWidget {
  Size size;
  Quote? quote;
  bool isLoading;
  QuoteComponent({Key? key, required this.size,  this.quote, required this.isLoading}) : super(key: key);

  @override
  State<QuoteComponent> createState() => _QuoteComponentState();
}

class _QuoteComponentState extends State<QuoteComponent> {

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      isLoading: widget.isLoading,
      skeleton: SkeletonParagraph(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 2.0,
            ),
            Text(
              "Stay Motivated",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontWeight: FontWeight.w500,
                color: darkGreyBlue,
              ),
            ),
            const SizedBox(height: 3.0),
            SizedBox(
              width: widget.size.width * .8, // it just take 60% of total width
              child: Text(
                "\"${ widget.isLoading == false ? widget.quote?.text : ''} \"",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: darkGreyBlue,
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                ),

              ),
            ),
            const SizedBox(height: 5.0),
            Text("- ${widget.isLoading == false ? widget.quote?.author : ''}", style: Theme.of(context).textTheme.headline5?.copyWith(
              fontWeight: FontWeight.w300,
              color: darkGreyBlue,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
