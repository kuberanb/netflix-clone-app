import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:netflix/controllers/fast_laugh_controller.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/Views/fast_laugh/widgets/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key, required});

  @override
  Widget build(BuildContext context) {
    final _fastLaughController = Get.find<FastLaughController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //  _fastLaughController.fastLaughDownloadfunction();
    });

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
              _fastLaughController.fastLaughdownloads.length, (index) {
            return GetBuilder(
              init: _fastLaughController,
              builder: ((_fastLaughController) {
                return _fastLaughController.isErrorDownloads.isTrue
                    ? const Center(
                        child: Text(
                          'Error Occured',
                          style: TextStyle(
                              color: kWhite,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : _fastLaughController.isLoadingDownloads.isTrue
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : VideoListItem(
                            index: index,
                          );
              }),
            );
          }),
        ),
      ),
    );
  }
}
