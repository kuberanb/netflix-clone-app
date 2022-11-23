import 'package:dartz/dartz.dart';
import 'package:netflix/models/search_model.dart';

import '../core/failures/main_failures.dart';

abstract class SearchService {
  Future<Either<MainFailure, Search>> searchMovies({
    required String movieQuery,
  });
}
