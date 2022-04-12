// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, avoid_renaming_method_parameters

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/shared_preference/shared_preference_manager.dart';

final kTitleStyle = TextStyle(
  fontSize: 24.0,
  color: techBlue,
  fontWeight: FontWeight.bold,
);

final kSubtitleStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF88869f),
  // color: Colors.blueGrey,
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          child: PageView(
            controller: pageViewController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Slide(
                hero: Image.asset("assets/images/finance_app.png"),
                title: "Jemina Capital Trading Platform",
                subtitle:
                    "Welcome to Jemina Capital Trading Platform; our in-house app developed by our talented research team, with the help of our experienced dealers. ",
                onNext: nextPage,
              ),
              Slide(
                hero: Image.asset(
                  "assets/images/smart_phone_data.png",
                  width: 300.0,
                ),
                title: "Data and Analytics",
                subtitle:
                    "Jemina Direct provides you with free access to data, analytics and capital markets information to help you identify strategies that will lead to your success in the capital markets.",
                onNext: nextPage,
              ),
              Slide(
                hero: Image.asset(
                  "assets/images/report_analysis.png",
                  width: 300.0,
                ),
                title: "News and Reports",
                subtitle:
                    "Ensure that your strategies will adapt to the ever changing market conditions by keeping up to date on all the imortant business news and trading updates.",
                onNext: nextPage,
              ),
              Slide(
                hero: Image.asset(
                  "assets/images/finance.png",
                  width: 300.0,
                ),
                title: "Trading",
                subtitle:
                    "Jemina Direct allows you to get direct access to the Zimbabwe Stock Exchange. You can safely and securely buy and sell stocks on the exchange on the with our experienced stock brokers and research team on the ready to assist you whenever you need.",
                onNext: nextPage,
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 60.0,
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/logo-no-bg.png",
                        width: size.width - 100.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        "Think Wealth Creation, Think Jemina!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 27.0),
                      child: Text(
                        "Our enthusiasm and skill motivates us to deliver cutting edge investment solutions premised on state of the art technology, adding value to the investing public. Login/Register to get started today.",
                        textAlign: TextAlign.center,
                        style: kSubtitleStyle,
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width - 350.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                SharedPreferenceManager sharedPreferenceManager = SharedPreferenceManager();
                                await sharedPreferenceManager.setShownWelcomeSlides(true);
                                Navigator.pushReplacementNamed(context, '/initialize');
                              },
                              child: Container(
                                padding: EdgeInsets.all(13.0),
                                child: Center(
                                  child: Text(
                                    "Get Started",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  // color: Color(0XFF2596be),
                                  color: techBlue,
                                  borderRadius: BorderRadius.circular(100.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: techBlue,
                                      offset: Offset(6, 2),
                                      blurRadius: 1.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
                  textAlign: TextAlign.center,
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
            size: 100.0,
            callback: onNext,
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

class _AnimatedIndicatorState extends State<AnimatedIndicator>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween(begin: 0.0, end: 100.0).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          widget.callback();
        }
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: ProgressPainter(animation.value),
        );
      },
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    // setup
    var linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = techBlue;

    var circlePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = techBlue;

    final radians = (progress / 100) * 2 * pi;
    _drawShape(canvas, linePaint, circlePaint, -pi / 2, radians, size);
  }

  void _drawShape(
    Canvas canvas,
    Paint linePaint,
    Paint circlePaint,
    double startRadian,
    double sweepRadian,
    Size size,
  ) {
    final centerX = size.width / 2, centerY = size.height / 2;
    final centerOffset = Offset(centerX, centerY);
    final double radius = min(size.width, size.height) / 2;

    canvas.drawArc(Rect.fromCircle(center: centerOffset, radius: radius),
        startRadian, sweepRadian, false, linePaint);

    final x = radius * (1 + sin(sweepRadian)),
        y = radius * (1 - cos(sweepRadian));
    final circleOffset = Offset(x, y);
    canvas.drawCircle(circleOffset, 5, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter old) => true;
}
