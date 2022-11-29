
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:netflix/controllers/home_page_controller.dart';
import 'package:netflix/core/constants.dart';

class HomeMovieCard extends StatelessWidget {
  final int index;
  List<String> posterPath;
   HomeMovieCard({super.key,required this.index,required this.posterPath});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final homeController = Get.find<HomePageController>();
    const String imgUrl = 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg';

    return Container(
      width: 0.3 * screenWidth,
      height: 0.25 * screenHeight,
      // color: kGrey,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image:  DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            posterPath[index]
              ),
        ),
      ),
    );
  }
}
