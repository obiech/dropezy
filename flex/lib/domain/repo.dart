import 'package:dartz/dartz.dart';
import 'package:flex/domain/entity/error.dart';
import 'package:flex/domain/entity/image.dart';

abstract class NasaApi {
  Future<Either<AppError, List<Photo>>> retrieveImage();
}
