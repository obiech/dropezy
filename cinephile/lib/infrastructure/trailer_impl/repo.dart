import 'package:cinephile/domain/core/error.dart';
import 'package:cinephile/domain/tralier/model/trailer_model.dart';
import 'package:cinephile/domain/tralier/repo.dart';
import 'package:cinephile/infrastructure/core/utils.dart';
import 'package:cinephile/infrastructure/trailer_impl/entity/trailer_entity.dart';
import 'package:dartz/dartz.dart';

class TrailerDataImpl extends TrailerData {
  final Client _client = Client();

  @override
  Future<Either<CinephileError, List<Trailer>>> getTrailer() async {
    try {
      var response = await _client.get();
      return Right((response.data['videos'] as List)
          .map((e) => TrailerEntity.fromJson(e).toModel())
          .toList());
    } catch (_) {
      return Left(CinephileError(_.toString()));
    }
  }
}
