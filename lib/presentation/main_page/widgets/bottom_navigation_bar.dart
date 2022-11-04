import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/core/colors/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: ((context, int newIndex, _) {
        return BottomNavigationBar(
            onTap: ((value) {
              indexChangeNotifier.value = value;
            }),
            currentIndex: newIndex,
            elevation: 0,
            selectedItemColor: kWhite,
            unselectedItemColor: kGrey,
            backgroundColor: backgroundColor,
            selectedIconTheme: const IconThemeData(color: kWhite),
            unselectedIconTheme: const IconThemeData(color: kGrey),
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_collection_outlined),
                  label: 'New & Hot'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions_outlined),
                  label: 'Fast Laughs'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download_for_offline_outlined),
                  label: 'Download'),
            ]);
      }),
    );
  }
}
