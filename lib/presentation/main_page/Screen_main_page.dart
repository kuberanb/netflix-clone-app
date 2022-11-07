import 'package:flutter/material.dart';
import 'package:netflix/core/Colors/colors.dart';
import 'package:netflix/presentation/downloads/ScreenDownload.dart';
import 'package:netflix/presentation/fast_laugh/Screen_fast_laugh.dart';
import 'package:netflix/presentation/home/Screen_home.dart';
import 'package:netflix/presentation/main_page/widgets/bottom_navigation_bar.dart';
import 'package:netflix/presentation/search/Screen_Search.dart';

import '../New and Hot/Screen_new_and_hot.dart';

List screens = const [
  ScreenHome(),
  ScreenNewandHot(),
  ScreenFastLaugh(),
  ScreenSearch(),
  ScreenDownload(),
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
