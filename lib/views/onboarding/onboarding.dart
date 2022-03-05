// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

final kTitleStyle = TextStyle(
  fontSize: 24.0,
  color: techBlue,
  fontWeight: FontWeight.bold,
);

final kSubtitleStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF88869f),
  fontWeight: FontWeight.w400,
);

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final pageViewController = new PageController(
    initialPage: 0,
  );

  void nextPage() {
    pageViewController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: PageView(
            controller: pageViewController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Slide(
                hero: Image.asset("assets/images/hero-1.png"),
                title: "This is the title",
                subtitle:
                    "Lalala lalala lalala la lalalalalala... la laaaaaa lalalalala lalalalala lalalalalala",
                onNext: nextPage,
              ),
              Slide(
                hero: Image.asset("assets/images/hero-2.png"),
                title: "This is title 2",
                subtitle:
                    "Lalala lalala lalala la lalalalalala... la laaaaaa lalalalala lalalalala lalalalalala",
                onNext: nextPage,
              ),
              Slide(
                hero: Image.asset("assets/images/hero-3.png"),
                title: "This is title 3",
                subtitle:
                    "Lalala lalala lalala la lalalalalala... la laaaaaa lalalalala lalalalala lalalalalala",
                onNext: nextPage,
              ),
              Slide(
                hero: Image.asset("assets/images/hero-1.png"),
                title: "This is the title 4",
                subtitle:
                    "Lalala lalala lalala la lalalalalala... la laaaaaa lalalalala lalalalala lalalalalala",
                onNext: nextPage,
              ),
              Container(
                child: Center(
                  child: Text("Think Wealth Creation, Think Jemina."),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Slide extends StatelessWidget {
  final Widget hero;
  final String title, subtitle;
  final VoidCallback onNext;

  const Slide({
    Key? key,
    required this.hero,
    required this.title,
    required this.subtitle,
    required this.onNext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: hero,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: kTitleStyle,
                ),
                SizedBox(height: 20.0),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: kSubtitleStyle,
                ),
                SizedBox(height: 35.0),
                ProgressButton(onNext: onNext)
              ],
            ),
          ),
          GestureDetector(
            onTap: onNext,
            child: Text(
              "Skip",
              style: kSubtitleStyle,
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.0,
      width: 75.0,
      child: Stack(
        children: [
          AnimatedIndicator(
            duration: const Duration(seconds: 10),
            size: 75,
            callBack: onNext,
          ),
          Center(
            child: GestureDetector(
              onTap: onNext,
              child: Container(
                decoration: BoxDecoration(
                    color: techBlue, borderRadius: BorderRadius.circular(99.0)),
                height: 60,
                width: 60,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/arrow.svg',
                    width: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedIndicator extends StatefulWidget {
  final Duration duration;
  final double size;
  final VoidCallback callback;

  AnimatedIndicator({
    Key? key,
    required this.duration,
    required this.size,
    required this.callback,
  }) : super(key: key);

  @override
  State<AnimatedIndicator> createState() => _AnimatedIndicatorState();
}

class _AnimatedIndicatorState extends State<AnimatedIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(widget.size, widget.size),
        painter: ProgressPainter(
          20.0,
        ),
      ),
    );
  }
}
