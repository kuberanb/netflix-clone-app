import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:netflix/api_services/search_services.dart';
import 'package:netflix/api_services/search_services_impl.dart';
import 'package:netflix/models/downloads_model.dart';
import 'package:netflix/models/search_model.dart';

import '../api_services/downloads_services_repo.dart';
import '../api_services/downloads_services_repo_impl.dart';
import '../core/failures/main_failures.dart';

class SearchController extends GetxController {
  late IdownloadsRepo _downloadsService;
  late SearchService _searchService;

  @override
  void onInit() {
   _searchService = Get.find<SearchServiceImpl>();
   _downloadsService = Get.find<DownloadsRepo>();
   searchDownloadfunction();
   searchfunction();
    

    // TODO: implement onInit
    super.onInit();
  }

  RxBool isLoading = false.obs;

  RxBool isError = false.obs;

  dynamic search ;

  var searchtext = "spider";

  //////////////////////////////////////////

  RxBool isLoadingDownloads = false.obs;

  RxBool isErrorDownloads = false.obs;

  List<Downloads> searchdownloads = [];

  // List<Downloads> idleList = [];

  // late List<SearchResultData> searchResultList;


  //idle list
  Future<void> searchDownloadfunction() async{

 // _downloadsService.

 isLoading(true);
    Either<MainFailure, List<Downloads>> downloadsOption =
        await _downloadsService.getDownloadImages();

  ////////////////////////////////////////////////        
        log(downloadsOption.toString());
  /////////////////////////////////////////////////

     downloadsOption.fold((MainFailure failure) {
      isLoadingDownloads(false);
      // downloadFailureorSucessOpttion =
      // Some(
      //   Left(failure),
      // );
      print(searchdownloads.toString());
      print(isLoadingDownloads.toString());
    }, (List<Downloads> sucess) {
           
      searchdownloads =
      sucess;
      // downloadFailureorSucessOpttion =
      // Some(
      //   Right(sucess),
      // );

    //  if(searchdownloads != null){
     isLoadingDownloads(false);
     isErrorDownloads(false);
    //  }

      print(searchdownloads.toString());
      print(isLoadingDownloads.toString());
    });

    // return downloadsOption;
  }
  
  ////////////////////////////////////////////////////////////////////////////////////
  

  // search list 
  Future<void> searchfunction() async {
    isLoading(true);

   // _downloadsService.getDownloadImages();

   // final result = await _downloadsService.getDownloadImages();

    Either<MainFailure, Search> searchOption;

    searchOption = await _searchService.searchMovies(movieQuery: searchtext);

    ///////////////////////////////////////////
    log(searchOption.toString());
    ////////////////////

    searchOption.fold(
      (MainFailure failure) {
        isLoading(false);
        isError(true);
      },
      (Search searchResult) {
        isError(false);
        isLoading(false);
        search = searchResult;
      },
    );
  }

}