part of 'photo_bloc.dart';

@freezed
class PhotoState with _$PhotoState {
  const factory PhotoState(
      {required Status status,
     @Default(AppError()) AppError error,
      required List<Photo> images}) = _PhotoState;
  factory PhotoState.initial() =>
      const PhotoState(status: Status.waiting, images: [],);
}
