// @dart=2.9

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:interview/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:interview/bloc/database_bloc/database_bloc.dart';
import 'package:interview/ui/request_phone_number.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview/router/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    String route = Routes.requestPhoneNumber;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthenticationBloc()),
        BlocProvider(
            create: (context) => DatabaseBloc()..add(RetrievePassword())),
      ],
      child: BlocListener<DatabaseBloc, DatabaseState>(
        listener: (context, state) {
          if (state is IsSignedIn) route = Routes.informationPage;
          
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Interview',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          builder: ExtendedNavigator(
            navigatorKey: navigatorKey,
            router: FlutterRoute(),
            initialRoute: route,
          ),
        ),
      ),
    );
  }
}
