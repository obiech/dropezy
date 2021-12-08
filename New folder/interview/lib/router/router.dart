import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:interview/ui/create_pin.dart';
import 'package:interview/ui/information.dart';
import 'package:interview/ui/request_phone_number.dart';
import 'package:interview/ui/verify_code.dart';


@AdaptiveAutoRouter(routes:<AutoRoute>[
  AutoRoute(page: RequestPhoneNumber, initial: true),
  AutoRoute(page:Verification),
  AutoRoute(page: CreatePin),
  AutoRoute(page: InformationPage)
])
class $FlutterRoute{}