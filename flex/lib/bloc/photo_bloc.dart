import 'package:dartz/dartz.dart';
import 'package:flex/domain/entity/error.dart';
import 'package:flex/domain/entity/image.dart';
import 'package:flex/domain/repo.dart';
import 'package:flex/infrastruture/photo_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'photo_event.dart';
part 'photo_state.dart';
part 'photo_bloc.freezed.dart';

enum Status { waiting, loading, failed, success }

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> with HydratedMixin {
  final NasaApi repo;
  PhotoBloc(this.repo) : super(PhotoState.initial()) {
    on<_RetrievePhotos>(onRetrievePhotos);
  }

  void onRetrievePhotos(_RetrievePhotos event, Emitter<PhotoState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final Either<AppError, List<Photo>> res = await repo.retrieveImage();
    res.fold(
        (error) => emit(state.copyWith(status: Status.failed, error: error)),
        (success) =>
            emit(state.copyWith(status: Status.success, images: success)));
  }

  @override
  PhotoState? fromJson(Map<String, dynamic> json) {
    return PhotoState(
        status: Status.success,
        images: (json['images'] as List<String>)
            .map((e) => PhotoModel.fromValue(e))
            .toList());
  }

  @override
  Map<String, dynamic>? toJson(PhotoState state) {
    if (state.status == Status.success) {
      return {'images': state.images.map((e) => e.url).toList()};
    }
    return null;
  }
}
