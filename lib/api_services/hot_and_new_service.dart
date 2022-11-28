
import 'package:dartz/dartz.dart';
import 'package:netflix/core/failures/main_failures.dart';
import 'package:netflix/models/hot_and_new_model.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewTvData();
}