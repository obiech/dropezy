import 'package:interview/utils/create_otp.dart';
import 'package:otp/otp.dart';

class OTPGenerator implements CreateOTP {
  @override
  String generateOTP() {
    return OTP.generateHOTPCodeString("JBSWY3DPEHPK3PXP", 7, length: 4);
  }

  @override
  bool verifyOTP(String correctOTP, String userOTP) {
    bool a = correctOTP == userOTP;
    return a;
  }
}
