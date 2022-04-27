// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'photo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PhotoEventTearOff {
  const _$PhotoEventTearOff();

  _RetrievePhotos retrievePhotos() {
    return const _RetrievePhotos();
  }
}

/// @nodoc
const $PhotoEvent = _$PhotoEventTearOff();

/// @nodoc
mixin _$PhotoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() retrievePhotos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? retrievePhotos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? retrievePhotos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RetrievePhotos value) retrievePhotos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RetrievePhotos value)? retrievePhotos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RetrievePhotos value)? retrievePhotos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoEventCopyWith<$Res> {
  factory $PhotoEventCopyWith(
          PhotoEvent value, $Res Function(PhotoEvent) then) =
      _$PhotoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PhotoEventCopyWithImpl<$Res> implements $PhotoEventCopyWith<$Res> {
  _$PhotoEventCopyWithImpl(this._value, this._then);

  final PhotoEvent _value;
  // ignore: unused_field
  final $Res Function(PhotoEvent) _then;
}

/// @nodoc
abstract class _$RetrievePhotosCopyWith<$Res> {
  factory _$RetrievePhotosCopyWith(
          _RetrievePhotos value, $Res Function(_RetrievePhotos) then) =
      __$RetrievePhotosCopyWithImpl<$Res>;
}

/// @nodoc
class __$RetrievePhotosCopyWithImpl<$Res> extends _$PhotoEventCopyWithImpl<$Res>
    implements _$RetrievePhotosCopyWith<$Res> {
  __$RetrievePhotosCopyWithImpl(
      _RetrievePhotos _value, $Res Function(_RetrievePhotos) _then)
      : super(_value, (v) => _then(v as _RetrievePhotos));

  @override
  _RetrievePhotos get _value => super._value as _RetrievePhotos;
}

/// @nodoc

class _$_RetrievePhotos implements _RetrievePhotos {
  const _$_RetrievePhotos();

  @override
  String toString() {
    return 'PhotoEvent.retrievePhotos()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RetrievePhotos);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() retrievePhotos,
  }) {
    return retrievePhotos();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? retrievePhotos,
  }) {
    return retrievePhotos?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? retrievePhotos,
    required TResult orElse(),
  }) {
    if (retrievePhotos != null) {
      return retrievePhotos();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RetrievePhotos value) retrievePhotos,
  }) {
    return retrievePhotos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_RetrievePhotos value)? retrievePhotos,
  }) {
    return retrievePhotos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RetrievePhotos value)? retrievePhotos,
    required TResult orElse(),
  }) {
    if (retrievePhotos != null) {
      return retrievePhotos(this);
    }
    return orElse();
  }
}

abstract class _RetrievePhotos implements PhotoEvent {
  const factory _RetrievePhotos() = _$_RetrievePhotos;
}

/// @nodoc
class _$PhotoStateTearOff {
  const _$PhotoStateTearOff();

  _PhotoState call(
      {required Status status, AppError? error, required List<Photo> images}) {
    return _PhotoState(
      status: status,
      error: error,
      images: images,
    );
  }
}

/// @nodoc
const $PhotoState = _$PhotoStateTearOff();

/// @nodoc
mixin _$PhotoState {
  Status get status => throw _privateConstructorUsedError;
  AppError? get error => throw _privateConstructorUsedError;
  List<Photo> get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotoStateCopyWith<PhotoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoStateCopyWith<$Res> {
  factory $PhotoStateCopyWith(
          PhotoState value, $Res Function(PhotoState) then) =
      _$PhotoStateCopyWithImpl<$Res>;
  $Res call({Status status, AppError? error, List<Photo> images});
}

/// @nodoc
class _$PhotoStateCopyWithImpl<$Res> implements $PhotoStateCopyWith<$Res> {
  _$PhotoStateCopyWithImpl(this._value, this._then);

  final PhotoState _value;
  // ignore: unused_field
  final $Res Function(PhotoState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? error = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
    ));
  }
}

/// @nodoc
abstract class _$PhotoStateCopyWith<$Res> implements $PhotoStateCopyWith<$Res> {
  factory _$PhotoStateCopyWith(
          _PhotoState value, $Res Function(_PhotoState) then) =
      __$PhotoStateCopyWithImpl<$Res>;
  @override
  $Res call({Status status, AppError? error, List<Photo> images});
}

/// @nodoc
class __$PhotoStateCopyWithImpl<$Res> extends _$PhotoStateCopyWithImpl<$Res>
    implements _$PhotoStateCopyWith<$Res> {
  __$PhotoStateCopyWithImpl(
      _PhotoState _value, $Res Function(_PhotoState) _then)
      : super(_value, (v) => _then(v as _PhotoState));

  @override
  _PhotoState get _value => super._value as _PhotoState;

  @override
  $Res call({
    Object? status = freezed,
    Object? error = freezed,
    Object? images = freezed,
  }) {
    return _then(_PhotoState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Photo>,
    ));
  }
}

/// @nodoc

class _$_PhotoState implements _PhotoState {
  const _$_PhotoState({required this.status, this.error, required this.images});

  @override
  final Status status;
  @override
  final AppError? error;
  @override
  final List<Photo> images;

  @override
  String toString() {
    return 'PhotoState(status: $status, error: $error, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PhotoState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.images, images));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(images));

  @JsonKey(ignore: true)
  @override
  _$PhotoStateCopyWith<_PhotoState> get copyWith =>
      __$PhotoStateCopyWithImpl<_PhotoState>(this, _$identity);
}

abstract class _PhotoState implements PhotoState {
  const factory _PhotoState(
      {required Status status,
      AppError? error,
      required List<Photo> images}) = _$_PhotoState;

  @override
  Status get status;
  @override
  AppError? get error;
  @override
  List<Photo> get images;
  @override
  @JsonKey(ignore: true)
  _$PhotoStateCopyWith<_PhotoState> get copyWith =>
      throw _privateConstructorUsedError;
}
