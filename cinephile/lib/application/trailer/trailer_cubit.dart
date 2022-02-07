import 'package:bloc/bloc.dart';
import 'package:cinephile/application/core/enums.dart';
import 'package:cinephile/domain/tralier/model/trailer_model.dart';
import 'package:cinephile/domain/tralier/repo.dart';
import 'package:cinephile/infrastructure/trailer_impl/repo.dart';
import 'package:equatable/equatable.dart';

part 'trailer_state.dart';

class TrailerCubit extends Cubit<TrailerState> {
  final TrailerData repo = TrailerDataImpl();
  TrailerCubit() : super(TrailerState.initial());

  void getTrailer() async {
    emit(state.copyWith(status: Status.loading));
    var resp = await repo.getTrailer();
    resp.fold(
        (l) =>
            emit(state.copyWith(status: Status.error, error: l.cinephileError)),
        (r) => emit(
            state.copyWith(status: Status.success, trailer: r, error: '')));
  }
}
