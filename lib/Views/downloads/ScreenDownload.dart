import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/Views/widgets/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

List images = [
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/b6IRp6Pl2Fsq37r9jFhGoLtaqHm.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gGEsBPAijhVUFoiNpgZXqRVWJt2.jpg',
  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg'
];

List widgets = [
  const _smartDownloads(),
  const Section2(),
  const Section3(),
];

class ScreenDownload extends StatelessWidget {
  const ScreenDownload({super.key});

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(title: 'Downloads')),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
            itemBuilder: ((context, index) => widgets[index]),
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 0,
                )),
            itemCount: widgets.length));
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhite, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        SizedBox(
          height: 0.03 * screenHeight,
        ),
        const Text(
          '''We'll download a personalized selections of\n movies and shows for you,so there's\n always something to watch on your\n device.''',
          style: TextStyle(color: kGrey, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 0.02 * screenHeight,
        ),
        SizedBox(
          width: screenWidth,
          height: screenWidth,
          //  color: Colors.transparent,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: kGrey.withOpacity(0.5),
                  radius: 0.37 * screenWidth,
                ),
                DownloadsImageWidget(
                  size: Size(size.width * 0.4, size.width * 0.58),
                  angle: 25,
                  images: images[0],
                  margin: const EdgeInsets.only(left: 125, bottom: 40,top:30),
                ),
                DownloadsImageWidget(
                  size: Size(size.width * 0.4, size.width * 0.58),
                  angle: -25,
                  images: images[1],
                  margin: const EdgeInsets.only(right: 125, bottom: 40,top:30),
                ),
                DownloadsImageWidget(
                  // size: -20,
                  size: Size(size.width * 0.45, size.width * 0.65),
                  images: images[2],
                  margin: const EdgeInsets.only(bottom: 0,top:20),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 0.02 * screenHeight,
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: Colors.blueAccent,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'SETUP',
                style: TextStyle(color: kWhite),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0.015 * screenHeight,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05 * screenWidth),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: kWhite,
              child: const Text(
                'See What You Can Download',
                style: TextStyle(color: kBlack),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0.02 * screenHeight,
        ),
      ],
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: 0.02 * screenHeight,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 0.03 * screenHeight,
            ),
            const Icon(
              Icons.settings,
              color: kWhite,
            ),
            SizedBox(
              width: 0.01 * screenWidth,
            ),
            const Text(
              'Smart Downloads',
              style: TextStyle(color: kWhite),
            ),
          ],
        ),
        SizedBox(height: 0.04 * screenHeight),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    this.angle = 0,
    required this.images,
    required this.margin,
    required this.size,
    this.radius = 10,

    //  required this.screenWidth,
  }) : super(key: key);

  //final double screenWidth;
  final Size size;
  final String images;
  final EdgeInsets margin;
  final double angle;
  final double radius;

  @override
  Widget build(BuildContext context) {
    //  final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      
      child: Transform.rotate(
        
        angle: angle * pi / 180,
        child: Container(
          width: size.width,
          height: size.height,
          //  color: kBlack,
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                images,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
