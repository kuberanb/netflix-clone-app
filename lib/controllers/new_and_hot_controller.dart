import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:netflix/api_services/hot_and_new_service.dart';
import 'package:netflix/api_services/hot_and_new_service_impl.dart';
import 'package:netflix/core/failures/main_failures.dart';
import 'package:netflix/models/hot_and_new_model.dart';

class NewAndHotController extends GetxController {
  late HotAndNewService _hotAndNew;

  @override
  void onInit() {
    Get.put(HotAndNewServiceImpl());
    _hotAndNew = Get.find<HotAndNewServiceImpl>();
    // TODO: implement onInit
    newAndHotTvFunction();
    newAndHotMovieFunction();

    super.onInit();
  }

  bool isLoadingnewAndHotTv = false;
  bool isErrornewAndHotTv = false;

  bool isLoadingnewAndHotMovie = false;
  bool isErrornewAndHotMovie = false;

  List<HotAndNewData> comingSoonList = [];

  List<HotAndNewData> everOneIsWatchingList = [];

  Future<void> newAndHotTvFunction() async {
    isLoadingnewAndHotTv = true;
   

    Either<MainFailure, HotAndNewResp> newAndHotTvOption;

    newAndHotTvOption = await _hotAndNew.getHotAndNewTvData();

    newAndHotTvOption.fold((MainFailure f) {

     isLoadingnewAndHotTv = false;
     isErrornewAndHotTv = true;
     update();

    }, (HotAndNewResp respo) {

      isLoadingnewAndHotTv = false;
      isErrornewAndHotTv = false;
      comingSoonList = respo.results;
      update();

    });
  }

  Future<void> newAndHotMovieFunction() async {
     isLoadingnewAndHotMovie = true;
    Either<MainFailure, HotAndNewResp> newAndHotMovieOption;

    newAndHotMovieOption = await _hotAndNew.getHotAndNewMovieData();

    newAndHotMovieOption.fold((MainFailure f) {

    isLoadingnewAndHotMovie = false;
    isErrornewAndHotTv = true;
    update();
    

    }, (HotAndNewResp respo) {

     isLoadingnewAndHotMovie = false;
     isErrornewAndHotMovie = false;
     everOneIsWatchingList = respo.results; 
     update();

    });
  }
}
