import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/search/widgets/Top_Search_Item_Tile.dart';
import 'package:netflix/presentation/search/widgets/search_Text_Title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w500_and_h282_face/tSxbUnrnWlR5dQvUgqMI7sACmFD.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const searchTextTitle(
            title: 'Top Searches',
          ),
          SizedBox(
            height: 0.02 * screenHeight,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) => const TopSearchItemTile()),
                separatorBuilder: ((context, index) => SizedBox(
                      height: 0.03 * screenHeight,
                    )),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
