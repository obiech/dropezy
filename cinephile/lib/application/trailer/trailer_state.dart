// ignore_for_file: prefer_const_constructors

part of 'trailer_cubit.dart';

class TrailerState extends Equatable {
  final List<Trailer> trailer;
  final String error;
  final Status status;
  const TrailerState(
      {required this.trailer, required this.error, required this.status});

  @override
  List<Object> get props => [trailer];

  factory TrailerState.initial() {
    return TrailerState(
        // ignore: prefer_const_literals_to_create_immutables
        trailer: [Trailer.empty()], error: '', status: Status.waiting);
  }

  TrailerState copyWith(
      {List<Trailer>? trailer, String? error, Status? status}) {
    return TrailerState(
        trailer: trailer ?? this.trailer,
        error: error ?? this.error,
        status: status ?? this.status);
  }
}
