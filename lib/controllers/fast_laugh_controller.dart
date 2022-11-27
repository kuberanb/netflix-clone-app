

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:netflix/models/downloads_model.dart';

import '../api_services/downloads_services_repo.dart';
import '../api_services/downloads_services_repo_impl.dart';
import '../core/failures/main_failures.dart';

class FastLaughController extends GetxController{
late IdownloadsRepo _downloadsService;

@override
  void onInit() {
    // TODO: implement onInit

    _downloadsService = Get.find<DownloadsRepo>();
     fastLaughDownloadfunction();
    super.onInit();
  }

  List<int> likedVideosIds = [];

 RxBool isLoadingDownloads = true.obs;

  RxBool isErrorDownloads = false.obs;

  RxList<Downloads> fastLaughdownloads = <Downloads>[].obs;


  void addLikedVideos({required int id}){
   
   likedVideosIds.add(id);
   update();
  }

  void removeLikedVideos({required int id}){
    
    likedVideosIds.remove(id);
     update();
  }


   Future<void> fastLaughDownloadfunction() async{

 // _downloadsService.

 isLoadingDownloads(true);
    Either<MainFailure, List<Downloads>> downloadsOption =
        await _downloadsService.getDownloadImages();

  ////////////////////////////////////////////////        
        log(downloadsOption.toString());
  /////////////////////////////////////////////////

     downloadsOption.fold((MainFailure failure) {
      isLoadingDownloads(false);
      isErrorDownloads(false);
      // downloadFailureorSucessOpttion =
      // Some(
      //   Left(failure),
      // );
      update();
      print(fastLaughdownloads.toString());
      print(isLoadingDownloads.toString());
    }, (List<Downloads> sucess) {
           
      fastLaughdownloads =
      RxList(sucess);
      // downloadFailureorSucessOpttion =
      // Some(
      //   Right(sucess),
      // );

    //  if(searchdownloads != null){
     isLoadingDownloads(false);
     isErrorDownloads(false);
     update();
    //  }

      print(fastLaughdownloads.toString());
      print(isLoadingDownloads.toString());
    });

    // return downloadsOption;
  }
  


}