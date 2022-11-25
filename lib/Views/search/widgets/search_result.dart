import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/Views/search/widgets/search_Text_Title.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

import '../../../controllers/search_controller.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w500_and_h282_face/tSxbUnrnWlR5dQvUgqMI7sACmFD.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _searchController = Get.find<SearchController>();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return _searchController.isLoading.isTrue
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : _searchController.isError.isTrue
            ? const Center(
                child: Text(
                  'Some Error Occured',
                  style: TextStyle(
                      color: kWhite, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              )
            : Padding(
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
                        childAspectRatio: 1.2 / 1.4,
                        children: List.generate(_searchController.search.length, (index) {
                          return MainCard(
                            index: index,
                          );
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
  MainCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final _searchController = Get.find<SearchController>();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              '$imageAppendUrl${_searchController.search[index].posterPath}'),
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
