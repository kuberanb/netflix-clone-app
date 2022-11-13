import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';

import 'Views/main_page/Screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: backgroundColor,
        primarySwatch: Colors.blue,
        appBarTheme:const AppBarTheme(backgroundColor: kBlack),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: kWhite),
          bodyText2: TextStyle(color: kWhite),
        ),
      ),
      home: const ScreenMainPage(),
    );
  }
}
