// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';

import '../../../../data/account_menu_json.dart';
import '../../../../data/user_profile.dart';
import '../../../../theme/colors.dart';
import '../../../../theme/padding.dart';
import '../../../../widgets/custom_button_box.dart';
import '../../../../widgets/custom_placeholder.dart';
import '../../../../widgets/custom_title.dart';
import 'package:easy_actions/easy_actions.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColorLight,
      appBar: AppBar(
        backgroundColor: kPrimaryColorLight,
        elevation: 0,
        iconTheme: IconThemeData(color: darkGreyBlue),
        centerTitle: true,
        title: Text('Profile', style: TextStyle(color: darkGreyBlue)),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: size.width * .3,
              width: size.width * .3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  UserProfile['image'].toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: smallSpacer),
          Center(
            child: Text(
              UserProfile['full_name'].toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: secondary,
              ),
            ),
          ),
          SizedBox(height: miniSpacer),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 15,
                  color: blueColor3,
                ),
              ),
            ),
          ),
          SizedBox(height: spacer),
          CustomTitle(
            title: "Personal Details",
            extend: false,
          ),
          SizedBox(height: smallSpacer - 10),
          ProfileDetailItem(
            icon: Icons.account_circle,
            title: "Name",
            value: "Johnson Andrew Siziba",
          ),
          ProfileDetailItem(
            icon: Icons.account_circle,
            title: "Gender",
            value: "Male",
          ),
          ProfileDetailItem(
            icon: Icons.account_circle,
            title: "Date Of Birth",
            value: "03/07/1996",
          ),
          ProfileDetailItem(
            icon: Icons.account_circle,
            title: "Nationality",
            value: "Zimbabwean",
          ),
          ProfileDetailItem(
            icon: Icons.account_circle,
            title: "ID Number",
            value: "24221046Y26",
          ),
          ProfileDetailItem(
            icon: Icons.account_circle,
            title: "Phone Number",
            value: "263784310119",
          ),
          ProfileDetailItem(
            icon: Icons.account_circle,
            title: "Home Address",
            value: "Plot 66, Block 8, Mhondoro-Ngezi, Muzvezve, Kadoma",
          ),
          ProfileDetailItem(
            icon: Icons.account_circle,
            title: "City/Town",
            value: "Harare",
          ),
          SizedBox(height: smallSpacer),
          CustomTitle(
            title: "KYC Details",
            extend: false,
          ),
          ProfileDetailItem(
            icon: Icons.verified_user,
            title: "Bank",
            value: "Agribank",
          ),
          ProfileDetailItem(
            icon: Icons.verified_user,
            title: "Branch",
            value: "Nelson Mandela",
          ),
          ProfileDetailItem(
            icon: Icons.verified_user,
            title: "Account Number",
            value: "100003201923",
          ),
          ProfileDetailItem(
            icon: Icons.verified_user,
            title: "Ecocash Number",
            value: "263784310119",
          ),
          ProfileDetailItem(
            icon: Icons.verified_user,
            title: "Source Of Funding",
            value: "Personal Funds",
          ),
          ProfileDetailItem(
            icon: Icons.verified_user,
            title: "Occupation",
            value: "Engineer",
          ),
          ProfileDetailItem(
            isFile: true,
            icon: Icons.verified_user,
            title: "National ID/Passport",
            value: "Open",
          ),
          ProfileDetailItem(
            isFile: true,
            icon: Icons.verified_user,
            title: "Proof Of Residence/Employment",
            value: "Open",
          ),
          SizedBox(height: smallSpacer),
          CustomTitle(
            title: "Trading Details",
            extend: false,
          ),
          ProfileDetailItem(
            icon: Icons.receipt_long,
            title: "Broker",
            value: "Jemina Capital",
          ),
          ProfileDetailItem(
            icon: Icons.receipt_long,
            title: "CSD Number",
            value: "210924051312-0001",
          ),
          ProfileDetailItem(
            icon: Icons.receipt_long,
            title: "ESD Number",
            value: "210924051312-0001",
          ),
          SizedBox(height: spacer),
          Column(
            children: List.generate(
              AccountMenuJson.length,
              (index) {
                List data = AccountMenuJson[index]['categories'];
                return Padding(
                  padding: const EdgeInsets.only(bottom: spacer),
                  child: Column(
                    children: [
                      CustomTitle(
                        title: AccountMenuJson[index]['title'],
                        extend: false,
                      ),
                      SizedBox(height: smallSpacer),
                      Column(
                        children: List.generate(
                          data.length,
                          (j) {
                            return CunstomPlaceHolder(
                              title: data[j]['title'],
                              isSwitch: data[j]['isSwitch'],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              showCupertinoModalPopup(
                  context: context, builder: (context) => getPopup());
            },
            child: CustomButtonBox(title: 'Sign Out'),
          ),
          SizedBox(height: smallSpacer),
          Container(
            alignment: Alignment.center,
            child: Text(
              'V1.0.1',
              style:
                  TextStyle(fontSize: 12.0, color: secondary.withOpacity(.5)),
            ),
          ),
          SizedBox(height: spacer),
        ],
      ),
    );
  }

  Widget getPopup() {
    return CupertinoActionSheet(
      title: const Text('Are you sure you want to sign out?'),
      cancelButton: CupertinoActionSheetAction(
        child: Text(
          'Cancel',
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <CupertinoActionSheetAction>[
        CupertinoActionSheetAction(
          onPressed: () {},
          child: const Text(
            'Sign Out',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

class ProfileDetailItem extends StatelessWidget {
  IconData icon;
  String title;
  String value;
  bool isFile;

  ProfileDetailItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    this.isFile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: blueColor1),
          SizedBox(width: smallSpacer - 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: darkGreyBlue,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: miniSpacer - 8),
              !isFile
                  ? Container(
                      width: 220,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                          color: greyCol,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: EasyOutlinedButton(
                        label: 'Open',
                        isRounded: true,
                        onPressed: () {},
                        color: blueColor1,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
