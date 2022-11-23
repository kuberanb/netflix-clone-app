import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:netflix/api_services/downloads_services_repo.dart';
import 'package:netflix/api_services/downloads_services_repo_impl.dart';
import 'package:netflix/core/failures/main_failures.dart';
import 'package:netflix/models/downloads_model.dart';

class DownloadsController extends GetxController {

  late IdownloadsRepo _downloadsRepo;

  @override
  void onInit() {
    _downloadsRepo = Get.find<DownloadsRepo>();
    downloadsfunction();
    
    

    super.onInit();
  }

  RxBool isLoading = false.obs;

  List<Downloads>? downloads;
  // = <Downloads>[].obs;

  var downloadFailureorSucessOpttion = none();

 // Future<Either<MainFailure, List<Downloads>>>? downloadsOption;

  Future<void> downloadsfunction() async { 
    isLoading(true);
    Either<MainFailure, List<Downloads>> downloadsOption =
        await _downloadsRepo.getDownloadImages();

////////////////////////////////////////////////        
        log(downloadsOption.toString());
/////////////////////////////////////////////////

     downloadsOption.fold((MainFailure failure) {
      isLoading(false);
      // downloadFailureorSucessOpttion =
      // Some(
      //   Left(failure),
      // );
      print(downloads.toString());
      print(isLoading.toString());
    }, (List<Downloads> sucess) {
           
      downloads =
      sucess;
      // downloadFailureorSucessOpttion =
      // Some(
      //   Right(sucess),
      // );

      if(downloads != null){
     isLoading(false);
      }

      // print(downloads.toString());
      // print(isLoading.toString());
    });

    // return downloadsOption;
  }
}
