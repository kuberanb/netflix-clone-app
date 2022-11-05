import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';
import 'package:netflix/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
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

        //  const Expanded(
        //   child:  SearchIdleWidget()),
        const Expanded(child: SearchResultWidget())
        ],
      ),
    );
  }
}
