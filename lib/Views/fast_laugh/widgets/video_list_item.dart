import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:netflix/controllers/fast_laugh_controller.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {

      final _fastLaughController = Get.find<FastLaughController>();
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),

                //left side icons
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

              // right side icons

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  Padding(
                    padding:const EdgeInsets.symmetric(horizontal:10.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        //  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/yB8BMtvzHlMmRT1WmTQnGv1bcOK.jpg'
                        
                        '$imageAppendUrl${_fastLaughController.fastLaughdownloads[index].posterPath}'
                          ),
                      radius: 25,
                    ),
                  ),
                  
                const  VideoActionWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                const  VideoActionWidget(icon: Icons.add, title: 'My List'),
                const  VideoActionWidget(icon: Icons.share, title: 'Share'),
                const  VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          SizedBox(
            height: 0.01 * screenHeight,
          ),
          IconButton(
            icon: Icon(icon),
            iconSize: 30,
            color: kWhite,
            onPressed: () {},
          ),
          // SizedBox(
          //   height: 0.01 * screenHeight,
          // ),
          Text(
            title,
            style: const TextStyle(color: kWhite, fontSize: 16),
          ),
          SizedBox(
            height: 0.01 * screenHeight,
          ),
        ],
      ),
    );
  }
}
