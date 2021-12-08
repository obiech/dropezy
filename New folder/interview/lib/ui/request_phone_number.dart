import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:interview/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:interview/router/router.gr.dart';
import 'package:interview/ui/widget/rounded_loading_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/ui/widget/shakeTransition.dart';

class RequestPhoneNumber extends StatefulWidget {
  const RequestPhoneNumber();

  @override
  _RequestPhoneNumberState createState() => _RequestPhoneNumberState();
}

class _RequestPhoneNumberState extends State<RequestPhoneNumber> {
  TextEditingController _phoneNumberController = TextEditingController();
  RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final formKey = GlobalKey<FormState>();

  ///To display error button
  void _buttonerror() async {
    _btnController.error();
    await Future.delayed(Duration(seconds: 3));
    _btnController.reset();
  }

  ///To display success button
  void _buttonsucces(String otp) async {
    _btnController.success();
    await Future.delayed(Duration(seconds: 3));
    _btnController.reset();
    ExtendedNavigator.root
        .push(Routes.verification, arguments: VerificationArguments(otp: otp));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 91),
              ShakeTransition(
                duration: Duration(milliseconds: 500),
                child: Text(
                  'Мой номер телефона',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 43),
              TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.numberWithOptions(),
                  autofocus: true,
                  validator: (_) {
                    if (_phoneNumberController.text.isEmpty)
                      return 'please input a valid Phone Number';
                  },
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Color(0xff181818)),
                  decoration: InputDecoration(focusColor: Color(0xff181818))),
              SizedBox(height: 14),
              ShakeTransition(
                duration: Duration(milliseconds: 500),
                child: Text(
                  '''Вам придет сообщение с кодом.\nНикому его не говорите.''',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff181818)),
                ),
              ),
              SizedBox(height: 380),
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is AuthenticationInitial) {
                    _btnController.start();
                  } else if (state is GeneratedOTPSuccessful) {
                    _buttonsucces(state.otp);
                  } else if (state is AuthenticationError) {
                    _buttonerror();
                  }
                },
                child: ShakeTransition(
                duration: Duration(milliseconds: 500),
                left: false,
                  child: RoundedLoadingButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) return;
                        BlocProvider.of<AuthenticationBloc>(context)
                          ..add(SendOTP(
                              phoneNumnber: _phoneNumberController.text.trim()));
                      },
                      controller: _btnController,
                      animateOnTap: false,
                      successColor: Colors.green,
                      height: 48,
                      width: 264,
                      color: Color(0xff1E315A),
                      child: Container(
                          height: 48,
                          width: 264,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(14)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xff1E315A),
                                    Color(0xff182647)
                                  ])),
                          child: Center(
                            child: Text('Продолжить',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFBFBFB))),
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
