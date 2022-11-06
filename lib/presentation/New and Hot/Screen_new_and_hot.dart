import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class ScreenNewandHot extends StatelessWidget {
  const ScreenNewandHot({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
     final screenHeight = MediaQuery.of(context).size.height;
    final textscale = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(0.12*screenHeight),
              child: AppBar(
                backgroundColor: backgroundColor,
                title: const Text(
                  'New & Hot',
                  style: TextStyle(
                      color: kWhite, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.cast,
                      color: kWhite,
                      size: 30 * textscale,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 0.003 * screenWidth,
                  ),
                  Container(
                    color: kBlue,
                    width: 35, // 0.09 * screenWidth,
                    height: 30, // * screenHeight,
                  ),
                ],
                bottom: TabBar(
                    indicatorWeight: 1,
                    labelColor: kBlack,
                    unselectedLabelColor: kWhite,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    indicator: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    isScrollable: true,
                    tabs: const [
                      Tab(
                        text: 'Coming Soon',
                      ),
                      Tab(
                        text: '''Everyone's Watching''',
                      ),
                    ]),
              ),
            ),
            body: const TabBarView(children: [
              Center(
                child: Text(
                  'Coming Soon',
                  style: TextStyle(color: kWhite),
                ),
              ),
              Center(
                child: Text(
                  '''Everyone's Watching''',
                  style: TextStyle(color: kWhite),
                ),
              ),
            ])),
      ),
    );
  }
}
