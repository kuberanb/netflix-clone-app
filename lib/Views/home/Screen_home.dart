import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:netflix/Views/home/widgets/background_card.dart';
import 'package:netflix/Views/home/widgets/home_movie_card.dart';
import 'package:netflix/Views/search/widgets/search_Text_Title.dart';
import 'package:netflix/controllers/home_page_controller.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:stroke_text/stroke_text.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final textscale = MediaQuery.of(context).textScaleFactor;
    final homeController = Get.put(HomePageController());

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
                  GetBuilder(
                    init: homeController,
                    builder: ((homeController) {
                      if (homeController.isLoading == true) {
                        return const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        );
                      } else if (homeController.isError == true) {
                        return const Center(
                          child: Text(
                            'Error While getting Data',
                            style: TextStyle(color: kWhite, fontSize: 22),
                          ),
                        );
                      }

                      final _releaseYear = homeController.pastYearMovieList.map(
                        (e) {
                          return '$imageAppendUrl${e.posterPath}';
                        },
                      ).toList();

                      final _trending = homeController.trendingMovieList.map(
                        (e) {
                          return '$imageAppendUrl${e.posterPath}';
                        },
                      ).toList();

                      final _tenseDramas =
                          homeController.tenseDramasMovieList.map(
                        (e) {
                          return '$imageAppendUrl${e.posterPath}';
                        },
                      ).toList();

                      final _southIndianMovies =
                          homeController.southIndianMovieList.map(
                        (e) {
                          return '$imageAppendUrl${e.posterPath}';
                        },
                      ).toList();

                      final _trendingTv = homeController.trendingTvList.map(
                        (e) {
                          return '$imageAppendUrl${e.posterPath}';
                        },
                      ).toList();

                      return SingleChildScrollView(
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

                            homeListTile(
                              posterPathList: _releaseYear,
                            ),
                            SizedBox(
                              height: 0.02 * screenHeight,
                            ),
                            const searchTextTitle(title: 'Trending Now '),
                            SizedBox(
                              height: 0.02 * screenHeight,
                            ),
                            homeListTile(
                              posterPathList: _trending,
                            ),
                            SizedBox(
                              height: 0.02 * screenHeight,
                            ),

                            const searchTextTitle(
                                title: 'Top 10 Tv Shows in India Today'),

                            SizedBox(
                              height: 0.02 * screenHeight,
                            ),
                            /////////////////////////
                            HomeMovieCardWithNumberListTile(imageList: _trendingTv ,),

                            const searchTextTitle(title: 'Tense Dramas'),
                            SizedBox(
                              height: 0.02 * screenHeight,
                            ),
                            homeListTile(
                              posterPathList: _tenseDramas,
                            ),
                            SizedBox(
                              height: 0.02 * screenHeight,
                            ),
                            const searchTextTitle(
                                title: 'South Indian Cinemas'),
                            SizedBox(
                              height: 0.02 * screenHeight,
                            ),
                            homeListTile(
                              posterPathList: _southIndianMovies,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
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
                                    errorBuilder:
                                        ((context, error, stackTrace) =>
                                            SizedBox(
                                              height: 0.05 * screenHeight,
                                              width: 0.01 * screenWidth,
                                              child: Image.asset(
                                                  'assets/download.png'),
                                            )),
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
  homeListTile({
    Key? key,
    //  required this.screenHeight,
    //  required this.screenWidth,
    required this.posterPathList,
  }) : super(key: key);

  // final double screenHeight;
  // final double screenWidth;
  List<String> posterPathList;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final homeController = Get.find<HomePageController>();

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 0.25 * screenHeight,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: homeController.pastYearMovieList.length,
          separatorBuilder: ((context, index) => SizedBox(
                width: 0.04 * screenWidth,
              )),
          itemBuilder: ((context, index) {
            return HomeMovieCard(
              index: index,
              posterPath: posterPathList,
            );
          }),
        ),
      ),
    );
  }
}

class HomeMovieCardWithNumber extends StatelessWidget {
   HomeMovieCardWithNumber({super.key, required this.index,required this.imageList});

  final int index;


  List<String> imageList;

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
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                   '${imageList[index]}' ),
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

   HomeMovieCardWithNumberListTile({super.key,required this.imageList});


  List<String> imageList;
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
              index: index, imageList: imageList,
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
