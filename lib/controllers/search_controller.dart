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
    searchfunction();
    

    // TODO: implement onInit
    super.onInit();
  }

  RxBool isLoading = false.obs;

  RxBool isError = false.obs;

  dynamic search;

  // List<Downloads> idleList = [];

  // late List<SearchResultData> searchResultList;


  Future<void> searchfunction() async {
    isLoading(true);

   // _downloadsService.getDownloadImages();

    Either<MainFailure, Search> searchOption;

    searchOption = await _searchService.searchMovies(movieQuery: 'sp');

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
