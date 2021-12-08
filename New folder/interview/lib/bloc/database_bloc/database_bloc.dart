import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interview/Model/user.dart';
import 'package:interview/repo/database.dart';
import 'package:interview/repo/database_sharedPrefence.dart';
import 'package:interview/utils/exception.dart';

part 'database_event.dart';
part 'database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final Database database = SharedPreferenceDatabase();
  DatabaseBloc() : super(DatabaseInitial()) {
    on<SavePassword>(_mapSavePasswordEventToState);
    on<RetrievePassword>(_mapRetrievePasswordEventToState);
  }

  Future<void> _mapSavePasswordEventToState(
    SavePassword event,
    Emitter<DatabaseState> emit,
  ) async {
    emit(DatabaseLoading());
    try {
      await database.savePassword(event.password);
      emit(DatabaseSuccess());
    } on GeneralException catch (err) {
      emit(DatabaseError(errorMessage: err.toString()));
    } catch (error) {
      emit(DatabaseError(errorMessage: error.toString()));
    }
  }

  Future<void> _mapRetrievePasswordEventToState(
    RetrievePassword event,
    Emitter<DatabaseState> emit,
  ) async {
    emit(DatabaseLoading());
    try {
      String? password = await database.getPassword();
      if (password!.isNotEmpty)
        emit(IsSignedIn(user: User.fromOject(password)));
    } on GeneralException catch (error) {
      emit(DatabaseError(errorMessage: error.toString()));
    } catch (error) {
      emit(DatabaseError(errorMessage: error.toString()));
    }
  }
}
