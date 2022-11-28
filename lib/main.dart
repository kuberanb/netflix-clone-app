import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Views/downloads/ScreenDownload.dart';
import 'package:netflix/controllers/bindings/downloads_binding.dart';
import 'package:netflix/controllers/bindings/fast_laugh_binding.dart';
import 'package:netflix/controllers/bindings/new_and_hot_binding.dart';
import 'package:netflix/controllers/bindings/search_binding.dart';
import 'package:netflix/core/colors/colors.dart';

import 'Views/main_page/Screen_main_page.dart';
import 'api_services/downloads_services_repo_impl.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // uncomment if needed for resource initialization
  DownloadsBinding().dependencies();
  SearchBinding().dependencies();
  FastLaughBinding().dependencies();
  NewAndHotBindings().dependencies;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: backgroundColor,
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(backgroundColor: kBlack),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: kWhite),
          bodyText2: TextStyle(color: kWhite),
        ),
      ),
      // getPages: [
      //   GetPage(name: "/downloads", page:(() =>    ScreenDownload()),binding: DownloadsBinding())
      // ],
      home: const ScreenMainPage(),
    );
  }
}
