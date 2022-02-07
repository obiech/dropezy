import 'package:bloc/bloc.dart';
import 'package:cinephile/application/core/enums.dart';
import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:cinephile/domain/now_showing/repo.dart';
import 'package:cinephile/infrastructure/movie_mock_data/mock_data.dart';
import 'package:equatable/equatable.dart';

part 'now_showing_state.dart';

class NowShowingCubit extends Cubit<NowShowingState> {
  final MoviesData repo = MockData();
  NowShowingCubit() : super(NowShowingState.initial());

  void getMovies() async {
    emit(state.copyWith(status: Status.loading));
    List<String> genres = [];
    final res = await repo.getMovies();
    res.fold(
        (l) =>
            emit(state.copyWith(status: Status.error, error: l.cinephileError)),
        (r) {
      r
          .map(
              (e) => genres.addAll(e.genres.map((e) => e.trim().toUpperCase())))
          .toList();
      final filteredGenres = genres.toSet().toList();
      emit(state.copyWith(
          status: Status.success, movies: r, genres: filteredGenres));
    });
  }
}
