import 'package:equatable/equatable.dart';

class CinephileError extends Equatable {
  final String? cinephileError;

  const CinephileError([this.cinephileError = 'Unknown Error.']);

  factory CinephileError.empty() {
    return const CinephileError('');
  }

  @override
  List<Object> get props => [cinephileError!];
}
