import 'package:flutter/material.dart';
import 'package:netflix/Views/fast_laugh/Screen_fast_laugh.dart';
import 'package:netflix/Views/home/Screen_home.dart';
import 'package:netflix/Views/main_page/widgets/bottom_navigation_bar.dart';
import 'package:netflix/core/Colors/colors.dart';

import '../New and Hot/Screen_new_and_hot.dart';
import '../downloads/ScreenDownload.dart';
import '../search/Screen_Search.dart';

List screens =  [
 const ScreenHome(),
 const ScreenNewandHot(),
 const ScreenFastLaugh(),
  ScreenSearch(),
 const ScreenDownload(),
];

class ScreenMainPage extends StatelessWidget {
  const ScreenMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: ((context, int value, _) {
            return screens[indexChangeNotifier.value];
          }),
        ),
        bottomNavigationBar: const BottomNavigationWidget(),
      ),
    );
  }
}
