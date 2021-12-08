// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/create_pin.dart';
import '../ui/information.dart';
import '../ui/request_phone_number.dart';
import '../ui/verify_code.dart';

class Routes {
  static const String requestPhoneNumber = '/';
  static const String verification = '/Verification';
  static const String createPin = '/create-pin';
  static const String informationPage = '/information-page';
  static const all = <String>{
    requestPhoneNumber,
    verification,
    createPin,
    informationPage,
  };
}

class FlutterRoute extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.requestPhoneNumber, page: RequestPhoneNumber),
    RouteDef(Routes.verification, page: Verification),
    RouteDef(Routes.createPin, page: CreatePin),
    RouteDef(Routes.informationPage, page: InformationPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    RequestPhoneNumber: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const RequestPhoneNumber(),
        settings: data,
      );
    },
    Verification: (data) {
      final args = data.getArgs<VerificationArguments>(
        orElse: () => VerificationArguments(otp: ''),
      );
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => Verification(
          otp: args.otp,
        ),
        settings: data,
      );
    },
    CreatePin: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const CreatePin(),
        settings: data,
      );
    },
    InformationPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const InformationPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// Verification arguments holder class
class VerificationArguments {
  final String otp;
  VerificationArguments({ required this.otp});
}
