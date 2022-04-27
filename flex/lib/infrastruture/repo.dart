import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flex/domain/entity/error.dart';
import 'package:flex/domain/entity/image.dart';
import 'package:flex/domain/repo.dart';
import 'package:flex/infrastruture/photo_model.dart';
import 'package:utils/utils.dart';

class NasaApiImpl implements NasaApi {
  final ApiClient _client;

  NasaApiImpl(this._client);
  @override
  Future<Either<AppError, List<Photo>>> retrieveImage() async {
    try {
      final Response res = await _client
          .get('https://api.nasa.gov/planetary/apod?count=10&api_key=DEMO_KEY');
      log(res.data.toString());
      return Right(
          (res.data as List).map((e) => PhotoModel.fromJson(e)).toList());
    } on AppException catch (e) {
      return Left(AppError.fromCode(e));
    } catch (e) {
      return const Left(AppError());
    }
  }
}
