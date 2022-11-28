import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix/api_services/api_endpoints.dart';
import 'package:netflix/api_services/hot_and_new_service.dart';
import 'package:netflix/models/hot_and_new_model.dart';
import 'package:netflix/core/failures/main_failures.dart';

class HotAndNewServiceImpl implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData() async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewMovie);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);

        return Right(result);
      } else {
        return Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async {
    try {
      final response = await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewTv);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);

        return Right(result);
      } else {
        return Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure());
    }
  }
}
