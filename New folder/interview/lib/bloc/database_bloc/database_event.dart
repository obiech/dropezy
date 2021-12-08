part of 'database_bloc.dart';

abstract class DatabaseEvent extends Equatable {
  const DatabaseEvent();

  @override
  List<Object> get props => [];
}

class SavePassword extends DatabaseEvent {
  final String password;

  SavePassword({required this.password});
}

class RetrievePassword extends DatabaseEvent{}
