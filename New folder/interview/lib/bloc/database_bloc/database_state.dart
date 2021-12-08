part of 'database_bloc.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object> get props => [];
}

class DatabaseInitial extends DatabaseState {}

class DatabaseSuccess extends DatabaseState {
}
class IsSignedIn extends DatabaseState{
  final User user;

  IsSignedIn({required this.user});
}

class DatabaseError extends DatabaseState {
  final String errorMessage;

  DatabaseError({required this.errorMessage});
}

class DatabaseLoading extends DatabaseState{}
