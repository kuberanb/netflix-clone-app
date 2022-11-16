import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:netflix/api_services/api_endpoints.dart';
import 'package:netflix/models/downloads_model.dart';

import 'package:netflix/core/failures/main_failures.dart';

import 'package:dartz/dartz.dart';

import 'downloads_services_repo.dart';

class DownloadsRepo implements IdownloadsRepo {
//  late IdownloadsRepo _downloadsRepo;

// DownloadsRepo(){

// _downloadsRepo = Get.put(DownloadsRepo());
// //  final  downloadsController = Get.put(DownloadsRepo());

// }

  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadImages() async {
    try {
      final Response response = await Dio(
        BaseOptions(),
      ).get(ApiEndPoints.downloads);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList = [];

        for (var downloaditems in response.data) {
          downloadsList.add(
            Downloads.fromJson(downloaditems as Map<String, dynamic>),
          );
        }
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return left(
          MainFailure.serverFailure(),
        );
      }
    } catch (_) {
      return Left(
        MainFailure.clientFailure(),
      );
    }

    // // TODO: implement getDownloadImages
    // throw UnimplementedError();
  }
}
