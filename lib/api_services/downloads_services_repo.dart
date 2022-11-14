

import 'package:dartz/dartz.dart';

import '../core/failures/main_failures.dart';
import '../models/downloads_model.dart';

abstract class IdownloadsRepo{

 Future<Either<MainFailure,List<Downloads>>> getDownloadImages();

}