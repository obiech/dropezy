part of 'now_showing_cubit.dart';

class NowShowingState extends Equatable {
  final List<Movie> movies;
  final List<String> genres;
  final String error;
  final Status status;
  const NowShowingState(
      {required this.movies,
      required this.error,
      required this.status,
      required this.genres});

  @override
  List<Object> get props => [movies, error, status];

  factory NowShowingState.initial() {
    return const NowShowingState(
        movies: [Movie.empty()], error: '', status: Status.waiting, genres: []);
  }

  NowShowingState copyWith(
      {List<Movie>? movies,
      String? error,
      Status? status,
      List<String>? genres}) {
    return NowShowingState(
        movies: movies ?? this.movies,
        error: error ?? this.error,
        status: status ?? this.status,
        genres: genres ?? this.genres);
  }
}
