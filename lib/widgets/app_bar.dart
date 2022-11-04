import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textscale = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: Row(
        children: [
          Text(title,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: kWhite,
                    fontSize: 30 * textscale,
                    fontWeight: FontWeight.bold),
              ),),
          const Spacer(),
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
            width:   35,// 0.09 * screenWidth,
            height: 35,  // * screenHeight,
          ),
        ],
      ),
    );
  }
}
