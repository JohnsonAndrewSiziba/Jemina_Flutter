// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unused_element, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:jemina_capital/data/constants/theme_colors.dart';
import 'package:jemina_capital/data/data.dart';

class CountersPage extends StatefulWidget {
  CountersPage({Key? key}) : super(key: key);

  @override
  State<CountersPage> createState() => _CountersPageState();
}

class _CountersPageState extends State<CountersPage> {
  List<String> _categories = [
    "All",
    "ZSE",
    "VFEX",
  ];

  int _selectedCategory = 0;

  Widget _buildCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 5.0,
        ),
        decoration: BoxDecoration(
          color: _selectedCategory == index ? techBlue : grayBackground,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          _categories[index],
          style: TextStyle(
            color: _selectedCategory == index ? Colors.white : complement,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Listed Securities",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        "Listed Securities on the ZSE and VFEX",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  labelText: "Search counter...",
                                  contentPadding: EdgeInsets.zero,
                                  filled: true,
                                  fillColor: lightGrey,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          customIconButton(
                            backgroundColor: lightGrey,
                            child: Image.asset('assets/icons/filter.png'),
                            onTap: () {},
                            radius: BorderRadius.circular(12.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _categories
                      .asMap()
                      .entries
                      .map((MapEntry map) => _buildCategories(map.key))
                      .toList(),
                ),
                SizedBox(
                  height: 25,
                ),
                _buildCountersListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCountersListView() {
    return ListView.builder(
        itemCount: countersData.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: CounterCard(
                  counter: countersData[index],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          );
        });
  }
}

class CounterCard extends StatelessWidget {
  final CounterDataModel counter;
  const CounterCard({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: counter.backgroundColor,
      ),
      height: 180.0,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 140,
                    child: Image.asset(counter.image),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: counter.name,
                    style: Theme.of(context).textTheme.headline4,
                    children: <TextSpan>[
                      TextSpan(
                        text: "\n Lorem Ipsum",
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
                Text(
                  counter.tagLine,
                  style: Theme.of(context).textTheme.caption,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ ${counter.price}",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    customOpenButton(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget customOpenButton() {
  return InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: () {},
    child: Container(
      width: 60,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: Text(
          "Open",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget customIconButton({
  required Widget child,
  required Function onTap,
  Color? splashColor,
  required Color backgroundColor,
  required BorderRadius radius,
}) {
  {
    return InkWell(
      borderRadius: radius,
      splashColor: splashColor,
      onTap: onTap(),
      child: Ink(
        padding: EdgeInsets.all(15.0),
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: radius,
        ),
        child: child,
      ),
    );
  }
}
