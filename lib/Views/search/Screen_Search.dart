import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/Views/search/widgets/search_idle.dart';
import 'package:netflix/Views/search/widgets/search_result.dart';
import 'package:netflix/controllers/downloads_controller.dart';
import 'package:netflix/controllers/search_controller.dart';
import 'package:netflix/core/colors/colors.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final _searchContoller = Get.find<SearchController>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      (_searchContoller.searchtext == null ||_searchContoller.searchtext.isEmpty  )?const SizedBox():
      _searchContoller.searchfunction();
    });
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  SizedBox(height: 0.02*screenHeight,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CupertinoSearchTextField(
              style: const TextStyle(color: kWhite),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: kGrey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: kGrey,
              ),
              //  backgroundColor: kGrey,
              decoration: BoxDecoration(
                color: kGrey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // SizedBox(
          //   height: 0.02 * screenHeight,
          // ),

          Expanded(
            child: (_searchContoller.search.isEmpty)
                ? const SearchIdleWidget()
                : const SearchResultWidget(),
          ),
          // const Expanded(child: SearchResultWidget(),),
        ],
      ),
    );
  }
}
