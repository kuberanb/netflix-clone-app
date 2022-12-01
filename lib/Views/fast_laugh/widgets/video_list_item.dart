import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/controllers/fast_laugh_controller.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';



final dummyvideoUrl = [
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4",
  ];



class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {

      final _fastLaughController = Get.find<FastLaughController>();
      final VideoUrl = dummyvideoUrl[index%dummyvideoUrl.length];

    return Stack(
      children: [
        // Container(
        //   color: Colors.accents[index % Colors.accents.length],
        // ),
       
       FastLaughVideoPlayer(videoUrl: VideoUrl,onchanged: ((bool) {
         
       }),),
       
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
                  GetBuilder(
                    init: _fastLaughController,
                    builder: ((_fastLaughController) {
                      final _index = index;

                      if(_fastLaughController.likedVideosIds.contains(_index)){
                         return VideoActionWidget(icon: Icons.favorite, title: 'LIKE',onpress: (){
                          _fastLaughController.removeLikedVideos(id: _index);
                         });
                      }
                    return VideoActionWidget(icon: Icons.favorite_outline_rounded, title: 'LIKE',onpress: (){_fastLaughController.addLikedVideos(id: _index);});
                  }),),
                  
                  
                  VideoActionWidget(icon: Icons.add, title: 'My List',onpress: (){},),
                  VideoActionWidget(icon: Icons.share, title: 'Share',onpress: (){
                   Share.share(_fastLaughController.fastLaughdownloads[index].posterPath.toString());
                  },),
                  VideoActionWidget(icon: Icons.play_arrow, title: 'Play',onpress: (){},),
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
 final VoidCallback onpress;
  const VideoActionWidget({super.key, required this.icon, required this.title,required this.onpress });

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
            onPressed:onpress
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

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  Function (bool) onchanged;
   FastLaughVideoPlayer({super.key,required this.videoUrl, required this.onchanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {

late VideoPlayerController _controller;


@override
  void initState() {
    // TODO: implement initState
    _controller = VideoPlayerController.network(widget.videoUrl);
    _controller.initialize().then((value) {
      setState(() {
         _controller.play();
      });
    });
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _controller.value.isInitialized
              ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child:VideoPlayer(_controller),)
              : const Center(child: CircularProgressIndicator(strokeWidth: 2,),),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
