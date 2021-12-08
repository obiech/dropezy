part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String error;

  AuthenticationError({required this.error});
}

class AuthenticationLoading extends AuthenticationState {}

class GeneratedOTPSuccessful extends AuthenticationState {
  final String otp;

  GeneratedOTPSuccessful(this.otp);
}
