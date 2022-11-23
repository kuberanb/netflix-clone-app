import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:netflix/api_services/search_services.dart';
import 'package:netflix/models/search_model.dart';
import 'package:netflix/core/failures/main_failures.dart';
import 'package:dio/dio.dart';

import 'api_endpoints.dart';

class SearchServiceImpl implements SearchService {
  @override
  Future<Either<MainFailure, Search>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(
        BaseOptions(),
      ).get(ApiEndPoints.search, queryParameters: {'query': movieQuery});

      if (response.statusCode == 200 || response.statusCode == 201) {
        // final List<Downloads> downloadsList = [];

        final result = Search.fromJson(response.data);

        // print(downloadsList);
        return Right(result);
      } else {
        return left(
          MainFailure.serverFailure(),
        );
      }
    } catch (e) {
      log(e.toString());
      return Left(
        MainFailure.clientFailure(),
      );
    }
  }
}
