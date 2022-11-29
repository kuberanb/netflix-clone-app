import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/api_services/hot_and_new_service_impl.dart';
import 'package:netflix/controllers/new_and_hot_controller.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

import '../home/Screen_home.dart';

class ScreenNewandHot extends StatelessWidget {
  const ScreenNewandHot({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textscale = MediaQuery.of(context).textScaleFactor;
    Get.put(NewAndHotController());
    Get.put(HotAndNewServiceImpl());

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.12 * screenHeight),
            child: AppBar(
              backgroundColor: backgroundColor,
              title: const Text(
                'New & Hot',
                style: TextStyle(
                    color: kWhite, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              actions: [
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
                  height: 30, // * screenHeight,
                ),
              ],
              bottom: TabBar(
                  indicatorWeight: 1,
                  labelColor: kBlack,
                  unselectedLabelColor: kWhite,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      text: 'Coming Soon',
                    ),
                    Tab(
                      text: '''Everyone's Watching''',
                    ),
                  ]),
            ),
          ),
          body: const TabBarView(children: [
            // Center(
            //   child: Text(
            //     'Coming Soon',
            //     style: TextStyle(color: kWhite),
            //   ),
            // ),
            CommingSoonPage(),
            // Center(
            //   child: Text(
            //     '''Everyone's Watching''',
            //     style: TextStyle(color: kWhite),
            //   ),
            // ),

            EveryoneWatchingPage(),
          ]),
        ),
      ),
    );
  }
}

class CommingSoonPage extends StatelessWidget {
  const CommingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textscale = MediaQuery.of(context).textScaleFactor;
    final _hotAndNewController = Get.find<NewAndHotController>();

    return RefreshIndicator(
      onRefresh: ((() async{
        _hotAndNewController.newAndHotMovieFunction();
      })),
      child: GetBuilder(
        init: _hotAndNewController,
        builder: ((_hotAndNewController) {
          if (_hotAndNewController.isLoadingnewAndHotTv) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (_hotAndNewController.isErrornewAndHotTv) {
            return const Center(
              child: Text(
                'Error Occured showing Coming Soon Page ',
                style: TextStyle(
                    color: kWhite, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            );
          } else if (_hotAndNewController.comingSoonList.isEmpty) {
            return const Center(
              child: Text(
                'Coming Soon List is Empty',
                style: TextStyle(
                    color: kWhite, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                height: 0,
              ),
              itemCount: _hotAndNewController.comingSoonList.length,
              itemBuilder: ((context, index) {
                if (_hotAndNewController.comingSoonList[index].id == null) {
                  return const SizedBox();
                }
    
                return comingSoonListItem(
                  index: index,
                );
              }),
            );
          }
        }),
      ),
    );
  }
}

class comingSoonListItem extends StatelessWidget {
  comingSoonListItem({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final _hotAndNewController = Get.find<NewAndHotController>();
    return Column(
      children: [
        SizedBox(
          height: 0.02 * screenHeight,
        ),
        Row(
          children: [
            Container(
              width: 0.2 * screenWidth,
              height: 0.6 * screenHeight,
              color: kBlack,
              child: Column(
                children: [
                  SizedBox(
                    height: 0.01 * screenHeight,
                  ),
                  const Text(
                    'OCT',
                    style: TextStyle(color: kGrey, fontSize: 30),
                  ),
                  const Text(
                    '10',
                    style: TextStyle(color: kWhite, fontSize: 30),
                  ),
                ],
              ),
            ),
            Container(
              width: 0.8 * screenWidth,
              height: 0.6 * screenHeight,
              color: kBlack,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 0.8 * screenWidth,
                    height: 0.29 * screenHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '$imageAppendUrl${_hotAndNewController.comingSoonList[index].posterPath}'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.01 * screenHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _hotAndNewController
                            .comingSoonList[index].title??'No Title ',
                        style: const TextStyle(
                            color: kWhite,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          HomeSectionOneButtons(
                              icon: Icons.notifications,
                              buttonText: 'Remind Me'),
                          HomeSectionOneButtons(
                              icon: Icons.info, buttonText: 'Info')
                        ],
                      ),
                    ],
                  ),
                   Text(
                    'Coming on ${_hotAndNewController.comingSoonList[index].releaseDate??'OCT 10 '}',
                    style:const TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 0.01 * screenHeight,
                  ),
                  Text(
                    _hotAndNewController.comingSoonList[index].originalTitle??'',
                    style: const TextStyle(color: kWhite, fontSize: 16),
                  ),
                  SizedBox(
                    height: 0.01 * screenHeight,
                  ),
                  Text(
                    '''${_hotAndNewController.comingSoonList[index].overview}''',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    style: const TextStyle(
                      color: kGrey,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class EveryoneWatchingPage extends StatelessWidget {
  const EveryoneWatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final _hotAndNewController = Get.find<NewAndHotController>();

    return RefreshIndicator(
      onRefresh: ((() async{
        _hotAndNewController.newAndHotTvFunction();
      })),
      child: GetBuilder(
        init: _hotAndNewController,
        builder: ((_hotAndNewController) {
          if (_hotAndNewController.isLoadingnewAndHotMovie) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (_hotAndNewController.isErrornewAndHotMovie) {
            return const Center(
              child: Text(
                'Error Occured showing Coming Soon Page ',
                style: TextStyle(
                    color: kWhite, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            );
          } else if (_hotAndNewController.everOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text(
                'Coming Soon List is Empty',
                style: TextStyle(
                    color: kWhite, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 0.01 * screenHeight,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                if (_hotAndNewController.everOneIsWatchingList[index].id ==
                    null) {
                  return const SizedBox();
                }
    
                return  EveryOneWatchingPageListItem(index: index,);
              },
              //child:
            );
          }
        }),
      ),
    );
  }
}

class EveryOneWatchingPageListItem extends StatelessWidget {
   EveryOneWatchingPageListItem({
    Key? key,
    required this.index
  }) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final _hotAndNewController = Get.find<NewAndHotController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 0.02 * screenHeight,
        ),
         Text(
          _hotAndNewController.everOneIsWatchingList[index].title.toString(),
          style: const TextStyle(
              color: kWhite, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        SizedBox(
          height: 0.01 * screenHeight,
        ),
         Text(
         _hotAndNewController.everOneIsWatchingList[index].overview.toString() ,
          style: TextStyle(color: kGrey, fontSize: 14),
        ),
        SizedBox(
          height: 0.03 * screenHeight,
        ),
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 0.3 * screenHeight,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      '$imageAppendUrl${_hotAndNewController.everOneIsWatchingList[index].posterPath}'),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: kBlack.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off_rounded,
                      color: kWhite,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 0.01 * screenHeight,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const EveryoneWatchingPageButtons(
                icon: Icons.share, buttonText: 'Share'),
            SizedBox(
              width: 0.04 * screenWidth,
            ),
            const EveryoneWatchingPageButtons(
                icon: Icons.add, buttonText: 'My List'),
            SizedBox(
              width: 0.04 * screenWidth,
            ),
            const EveryoneWatchingPageButtons(
                icon: Icons.play_arrow_rounded, buttonText: 'Play'),
            SizedBox(
              width: 0.04 * screenWidth,
            ),
          ],
        ),
      ],
    );
  }
}

class EveryoneWatchingPageButtons extends StatelessWidget {
  const EveryoneWatchingPageButtons(
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
