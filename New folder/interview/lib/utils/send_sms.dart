import 'package:interview/utils/exception.dart';
import 'package:interview/utils/otp_sender.dart';
import 'package:sms/sms.dart';

class SMSsender implements OTPSender {
  SmsSender sender = new SmsSender();

  @override
  void sendOTP({required String phoneNumber, required String otp}) {
    if (phoneNumber.startsWith('0'))phoneNumber= phoneNumber.replaceFirst('0', '');

    String address = ('+7') + phoneNumber.trim();
    try {
      sender
          .sendSms(new SmsMessage(address, 'Your OTP is : ' + otp.toString()));
    } catch (_) {
      throw GeneralException(_.toString());
    }
   
  }
}
