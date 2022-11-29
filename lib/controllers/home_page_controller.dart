

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:netflix/api_services/hot_and_new_service_impl.dart';
import 'package:netflix/core/failures/main_failures.dart';

import '../api_services/hot_and_new_service.dart';
import '../models/hot_and_new_model.dart';

class HomePageController extends GetxController{
   late HotAndNewService _hotAndNew;


// We used the implementation of api and created models of the page Hot And New Page

  @override
  void onInit() {
    Get.put(HotAndNewServiceImpl());
    // TODO: implement onInit
    _hotAndNew = Get.find<HotAndNewServiceImpl>();
    newAndHotMovieFunction();
    newAndHotTvFunction();
    super.onInit();
  }

  bool isLoading = false;
  bool isError = false;

  List<HotAndNewData> pastYearMovieList = [];

  String stateId = '';

  List<HotAndNewData> trendingMovieList = [];

  List<HotAndNewData> tenseDramasMovieList = [];

  List<HotAndNewData> southIndianMovieList = [];

  List<HotAndNewData> trendingTvList = [];


  Future<void> newAndHotTvFunction() async {
    isLoading = true;
   
    Either<MainFailure, HotAndNewResp> newAndHotTvOption;

    newAndHotTvOption = await _hotAndNew.getHotAndNewTvData();

    newAndHotTvOption.fold((MainFailure f) {

     isLoading = false;
     isError = true;
     update();

    }, (HotAndNewResp respo) {

      isLoading = false;
      isError = false;
      
      trendingTvList = respo.results;

      update();

    });
  }

  Future<void> newAndHotMovieFunction() async {
     isLoading = true;
    Either<MainFailure, HotAndNewResp> newAndHotMovieOption;

    newAndHotMovieOption = await _hotAndNew.getHotAndNewMovieData();

    newAndHotMovieOption.fold((MainFailure f) {

    isLoading = false;
    isError = true;
    update();
    

    }, (HotAndNewResp respo) {

     isLoading = false;
     isError = false;
     stateId = '0';
     final pastYear = respo.results;
     final trending = respo.results;
     final tenseDramas = respo.results;
     final southIndian = respo.results;
     pastYear.shuffle();
     trending.shuffle();
     tenseDramas.shuffle();
     southIndian.shuffle();

     pastYearMovieList = pastYear;
     trendingMovieList = trending;
     tenseDramasMovieList = tenseDramas;
     southIndianMovieList = southIndian;
     
   //  everOneIsWatchingList = respo.results; 

     update();

    });
  }




   
}