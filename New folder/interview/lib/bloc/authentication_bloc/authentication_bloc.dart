import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interview/utils/create_otp.dart';
import 'package:interview/utils/exception.dart';
import 'package:interview/utils/generate_otp.dart';
import 'package:interview/utils/otp_sender.dart';
import 'package:interview/utils/send_sms.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  CreateOTP otpGenerator = OTPGenerator();
  OTPSender otpSender = SMSsender();
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<SendOTP>(_mapSendOTPEventToState);
    on<VerifyOTP>(_mapVerifyOTPEventToState);
  }
  Future<void> _mapSendOTPEventToState(
    SendOTP event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    try {
      String otp = otpGenerator.generateOTP();
      otpSender.sendOTP(phoneNumber: event.phoneNumnber, otp: otp);
      emit(GeneratedOTPSuccessful(otp));
    } on GeneralException catch (err) {
      emit(AuthenticationError(error: err.toString()));
    } catch (error) {
      emit(AuthenticationError(error: error.toString()));
    }
  }

  Future<void> _mapVerifyOTPEventToState(
    VerifyOTP event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    try {
      if (otpGenerator.verifyOTP(event.enteredOTP, event.correctOTP)) {
        emit(AuthenticationSuccess());
      } 
      else {
        emit(AuthenticationError(error: 'false'));
      }
    } on GeneralException catch (err) {
      emit(AuthenticationError(error: err.toString()));
    } catch (error) {
      emit(AuthenticationError(error: error.toString()));
    }
  }
}
