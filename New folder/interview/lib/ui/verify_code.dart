import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:interview/router/router.gr.dart';
import 'package:interview/ui/widget/rounded_loading_button.dart';
import 'package:interview/ui/widget/shakeTransition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verification extends StatefulWidget {
  final String otp;
  const Verification({ required this.otp});

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  TextEditingController textEditingController = TextEditingController();
  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  String currentText = "";
  bool isFullyFilled = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  ///To display error button
  void _buttonerror() async {
    _btnController.error();
    errorController!.add(ErrorAnimationType.shake);
    await Future.delayed(Duration(seconds: 3));
    _btnController.reset();
  }

  ///To display success button
  void _buttonsucces() async {
    _btnController.success();
    await Future.delayed(Duration(seconds: 3));
    _btnController.reset();
    ExtendedNavigator.root
        .push(Routes.createPin);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: ShakeTransition(
                duration: Duration(milliseconds: 500),
          child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_new_rounded,
                  color: Color(0xffB0B0B0), size: 16)),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 91),
              ShakeTransition(
                duration: Duration(milliseconds: 500),
                child: Text(
                  'Код из сообщения',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 43),
              PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                // backgroundColor: Colors.transparent,
                length: 4,
                autoFocus: true,
                obscureText: true,
                obscuringCharacter: '*',
                useHapticFeedback: true,
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                hapticFeedbackTypes: HapticFeedbackTypes.medium,
                validator: (v) {
                  if (v!.length < 4) {
                    return "Неправильный код. Повторите пожалуйста еще раз.";
                  } 
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  activeColor: Colors.black,

                  inactiveColor: Colors.black,
                  selectedColor: Colors.black,
                  errorBorderColor: Colors.red,
                  inactiveFillColor: Colors.transparent,
                  selectedFillColor: Colors.transparent,
                  activeFillColor: Colors.transparent,
                ),
                cursorColor: Colors.black,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                onCompleted: (v) {
                  setState(() {
                    isFullyFilled = true;
                  });
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              SizedBox(height: 380),
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is AuthenticationError)
                    _buttonerror();
                  else if (state is AuthenticationLoading)
                    _btnController.start();
                  else if (state is AuthenticationSuccess) _buttonsucces();
                },
                child: ShakeTransition(
                  left: false,
                  duration: Duration(milliseconds: 500),
                  child: RoundedLoadingButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() && isFullyFilled) {
                          BlocProvider.of<AuthenticationBloc>(context)
                            ..add(VerifyOTP(
                                correctOTP: widget.otp,
                                enteredOTP: textEditingController.text.trim()));
                        }
                      },
                      animateOnTap: false,
                      controller: _btnController,
                      successColor: Colors.green,
                      height: 48,
                      width: 264,
                      color: Colors.transparent,
                      child: Container(
                          height: 48,
                          width: 264,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(14)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: isFullyFilled
                                      ? ([Color(0xff1E315A), Color(0xff182647)])
                                      : [Color(0xffE9E9E9), Color(0xffE9E9E9)])),
                          child: Center(
                            child: Text('Продолжить',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: isFullyFilled
                                        ? Color(0xffFBFBFB)
                                        : Color(0xffBBBBBB))),
                          ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
