part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class SendOTP extends AuthenticationEvent {
  final String phoneNumnber;
  final String? messageText;

  SendOTP({required this.phoneNumnber, this.messageText});
}

class VerifyOTP extends AuthenticationEvent {
  final String enteredOTP;
  final String correctOTP;

  VerifyOTP( {required this.correctOTP,required this.enteredOTP});
}
