import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/home/Screen_home.dart';

class BackGroundCard extends StatelessWidget {
  const BackGroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 0.7 * screenHeight,
          //  color: Colors.amberAccent,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/5YZ8JKV8i437z6O4YQ2IEzcSlsD.jpg')),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          // top: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                HomeSectionOneButtons(icon: Icons.add, buttonText: 'My List'),
                _playButton(),
                HomeSectionOneButtons(icon: Icons.info, buttonText: 'Info'),
                // SizedBox(
                //   height: 0.02 * screenHeight,
                // ),
              ],
            ),
          ),
        ),

        ///////////////
      ],
    );
  }
}

class _playButton extends StatelessWidget {
  const _playButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(
        Icons.play_arrow_rounded,
        color: kBlack,
      ),
      onPressed: () {},
      label: const Text(
        'Play',
        style: TextStyle(color: kBlack),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kWhite),
      ),
    );
  }
}
