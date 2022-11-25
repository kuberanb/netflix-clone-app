import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/Views/search/widgets/search_Text_Title.dart';

import '../../../controllers/search_controller.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w500_and_h282_face/tSxbUnrnWlR5dQvUgqMI7sACmFD.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const searchTextTitle(title: 'Movies & Tv'),
          SizedBox(
            height: 0.02 * screenHeight,
          ),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 1.2/1.4,
              children: List.generate(20, (index) {
                return  MainCard(index: index,);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  int index;
   MainCard({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    final _searchController = Get.find<SearchController>();
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(_searchController.search[index].posterPath??imageUrl),
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
