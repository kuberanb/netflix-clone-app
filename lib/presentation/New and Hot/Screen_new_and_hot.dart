import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/home/Screen_home.dart';

class ScreenNewandHot extends StatelessWidget {
  const ScreenNewandHot({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textscale = MediaQuery.of(context).textScaleFactor;

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

    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 0,
      ),
      itemCount: 10,
      itemBuilder: ((context, index) {
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
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/nKDvDVSaFFBrQr0NoPiyasEN8Mk.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.01 * screenHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Terrifier 2',
                            style: TextStyle(
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
                      const Text(
                        'Coming on OCT 10',
                        style: TextStyle(
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 0.01 * screenHeight,
                      ),
                      const Text(
                        'Terrifier 2',
                        style: TextStyle(color: kWhite, fontSize: 16),
                      ),
                      SizedBox(
                        height: 0.01 * screenHeight,
                      ),
                      const Text(
                        '''After being resurrected by a sinister entity,
Art the Clown Returns to miles Country Where 
he must hunt down and destroy a teenage 
girl and her younger brother on Halloween
night, As the body Count rises,the siblings
fight to stay alive while uncovering the true
nature of Arts's evil intent''',
                        style: TextStyle(
                          color: kGrey,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

class EveryoneWatchingPage extends StatelessWidget {
  const EveryoneWatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView.separated(

      separatorBuilder: (context, index) => SizedBox(height: 0.01*screenHeight,),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.02 * screenHeight,
          ),
          const Text(
            'House of the Dragon',
            style: TextStyle(
                color: kWhite, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            height: 0.01 * screenHeight,
          ),
          const Text(
            '''The Targyan Dynasty is at the absolute apex of its 
power, with more than 15 dragons under their yoke.
Most empires crumble from such heights. In the case 
of the Taryans their slow fall begins when King 
Vicerys breaks with a century of tradition by naming his daughter Rhaneeyra heir to the Iron Throne But When
Viserys later fathers a son, the court is shocked When   
Rhaneyra retains her status as his heir, and seeds of 
division sow friction acress realm ''',
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/yYrvN5WFeGYjJnRzhY0QXuo4Isw.jpg'),
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


      },
      //child: 
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
