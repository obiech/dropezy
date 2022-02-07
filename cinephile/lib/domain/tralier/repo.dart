import 'package:cinephile/domain/core/error.dart';
import 'package:cinephile/domain/tralier/model/trailer_model.dart';
import 'package:dartz/dartz.dart';

abstract class TrailerData {
  Future<Either<CinephileError, List<Trailer>>> getTrailer();
}
