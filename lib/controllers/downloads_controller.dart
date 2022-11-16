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

    super.onInit();
  }

  RxBool isLoading = false.obs;

  List<Downloads>? downloads;

  final downloadFailureorSucessOpttion = none();

  Future<Either<MainFailure, List<Downloads>>>? downloadsOption;

  Future<void> downloadsfunction() async {
    isLoading(true);
    Either<MainFailure, List<Downloads>> downloadsOption =
        await _downloadsRepo.getDownloadImages();

    return downloadsOption.fold((failure) {
      isLoading(false);
      downloadFailureorSucessOpttion:
      Some(
        Left(failure),
      );
    }, (sucess) {
      isLoading(false);
      downloads:
      sucess;
      downloadFailureorSucessOpttion:
      Some(
        Right(sucess),
      );
    });

    // return downloadsOption;
  }
}
