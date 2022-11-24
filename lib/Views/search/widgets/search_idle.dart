import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/Views/search/widgets/search_Text_Title.dart';
import 'package:netflix/controllers/search_controller.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constants.dart';

import 'Top_Search_Item_Tile.dart';

//const imageUrl =
//    'https://www.themoviedb.org/t/p/w500_and_h282_face/tSxbUnrnWlR5dQvUgqMI7sACmFD.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final searchDownloadController = Get.find<SearchController>();
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
            child: Obx(
              (() {

              if(searchDownloadController.isLoadingDownloads.isTrue){
                
                return const Center(child: CircularProgressIndicator(),);
              }else if(searchDownloadController.isErrorDownloads.isTrue){
                return const Center(child: Text('Error Ocurred',style: TextStyle(color: kWhite,fontSize: 24,),),);
              }else if(searchDownloadController.searchdownloads.isEmpty ){
               return const Center(child: Text('List is Empty',style: TextStyle(color: kWhite,fontSize: 24,),),);
              }

                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {

                     final movie = searchDownloadController.searchdownloads[index];
                     return TopSearchItemTile(title: movie.title, imageUrl: '$imageAppendUrl${movie.posterPath}');

                    }
                       // const TopSearchItemTile()
                        
                        ),
                    separatorBuilder: ((context, index) => SizedBox(
                          height: 0.03 * screenHeight,
                        )),
                    itemCount: searchDownloadController.searchdownloads.length);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
