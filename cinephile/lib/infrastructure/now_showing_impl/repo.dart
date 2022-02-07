import 'package:cinephile/domain/core/error.dart';
import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:cinephile/domain/now_showing/repo.dart';
import 'package:cinephile/infrastructure/core/utils.dart';
import 'package:cinephile/infrastructure/now_showing_impl/entity/movie_entity.dart';
import 'package:dartz/dartz.dart';

class MoviesDataImpl extends MoviesData {
  final Client _client = Client();

  @override
  Future<Either<CinephileError, List<Movie>>> getMovies() async {
    try {
      var response = await _client.get();
      return Right((response.data['movies'] as List)
          .map((e) => MovieEntity.fromJson(e).toModel())
          .toList());
    } catch (_) {
      return Left(CinephileError(_.toString()));
    }
  }
}
