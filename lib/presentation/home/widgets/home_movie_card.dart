
import 'package:flutter/material.dart';

class HomeMovieCard extends StatelessWidget {
  const HomeMovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: 0.3 * screenWidth,
      height: 0.25 * screenHeight,
      // color: kGrey,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg'),
        ),
      ),
    );
  }
}
