import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/home/widgets/background_card.dart';
import 'package:netflix/presentation/home/widgets/home_movie_card.dart';
import 'package:netflix/presentation/search/widgets/search_Text_Title.dart';
import 'package:stroke_text/stroke_text.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final textscale = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: ((context, value, child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;

                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                print(direction);
                return true;
              },
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BackGroundCard(),

                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),
                        const searchTextTitle(
                            title: 'Released in the Past Year'),
                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),

                        const homeListTile(),
                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),
                        const searchTextTitle(title: 'Trending Now '),
                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),
                        const homeListTile(),
                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),

                        const searchTextTitle(
                            title: 'Top 10 Tv Shows in India Today'),

                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),
                        /////////////////////////
                        const HomeMovieCardWithNumberListTile(),

                        const searchTextTitle(title: 'Tense Dramas'),
                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),
                        const homeListTile(),
                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),
                        const searchTextTitle(title: 'South Indian Cinemas'),
                        SizedBox(
                          height: 0.02 * screenHeight,
                        ),
                        const homeListTile(),
                      ],
                    ),
                  ),
                  scrollNotifier.value == true
                      ? Container(
                          width: double.infinity,
                          height: 0.2 * screenHeight,
                          color: kGrey.withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Container(
                                  //   width: 0.01 * screenWidth,
                                  //   height: 50,
                                  //   decoration: const BoxDecoration(
                                  //     image: DecorationImage(
                                  //       image: AssetImage(
                                  //           'assets/netflix_logo.png'),
                                  //     ),
                                  //   ),
                                  // ),

                                  Image.network(
                                    'https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png',
                                    height: 120,
                                    width: 80,
                                  ),

                                  Row(
                                    children: [
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
                                        width: 35, // 0.09 * screenWidth,
                                        height: 35, // * screenHeight,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text(
                                    'Tv Shows',
                                    style:
                                        TextStyle(color: kWhite, fontSize: 18),
                                  ),
                                  Text(
                                    'Movies',
                                    style:
                                        TextStyle(color: kWhite, fontSize: 18),
                                  ),
                                  Text(
                                    'Categories',
                                    style:
                                        TextStyle(color: kWhite, fontSize: 18),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class homeListTile extends StatelessWidget {
  const homeListTile({
    Key? key,
    //  required this.screenHeight,
    //  required this.screenWidth,
  }) : super(key: key);

  // final double screenHeight;
  // final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 0.25 * screenHeight,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          separatorBuilder: ((context, index) => SizedBox(
                width: 0.04 * screenWidth,
              )),
          itemBuilder: ((context, index) {
            return const HomeMovieCard();
          }),
        ),
      ),
    );
  }
}

class HomeMovieCardWithNumber extends StatelessWidget {
  const HomeMovieCardWithNumber({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0.1 * screenWidth),
            child: Container(
              width: 0.3 * screenWidth,
              height: 0.25 * screenHeight,
              // color: kGrey,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/zHQy4h36WwuCetKS7C3wcT1hkgA.jpg'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: StrokeText(
              text: "${index + 1}",
              textStyle: const TextStyle(fontSize: 100, color: kBlack),
              strokeColor: kWhite,
              strokeWidth: 5,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeMovieCardWithNumberListTile extends StatelessWidget {
  const HomeMovieCardWithNumberListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Container(
        width: double.infinity,
        height: 0.25 * screenHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          // separatorBuilder: ((context, index) => SizedBox(
          //       width: 0.04 * screenWidth,
          //     )),
          itemBuilder: ((context, index) {
            return HomeMovieCardWithNumber(
              index: index,
            );
          }),
        ),
      ),
    );
  }
}

class HomeSectionOneButtons extends StatelessWidget {
  const HomeSectionOneButtons(
      {super.key, required this.icon, required this.buttonText});

  final IconData icon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: 30,
        ),
        Text(
          buttonText,
          style: const TextStyle(color: kWhite, fontSize: 18),
        ),
      ],
    );
  }
}
