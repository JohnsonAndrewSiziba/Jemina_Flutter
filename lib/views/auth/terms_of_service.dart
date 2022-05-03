import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';


class TermsOfService extends StatefulWidget {
  const TermsOfService({Key? key}) : super(key: key);

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorLight1,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColorLight,
        iconTheme: IconThemeData(color: darkGreyBlue),
        title: Text('Terms of Service', style: TextStyle(color: darkGreyBlue),),
      ),
      body: const Center(
        child: Text('Terms of Service',),
      ),
    );
  }
}
