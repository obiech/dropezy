import 'package:cinephile/domain/core/error.dart';
import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesData {
  Future<Either<CinephileError, List<Movie>>> getMovies();
}
