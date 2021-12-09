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
      child:
          BlocConsumer<DatabaseBloc, DatabaseState>(listener: (context, state) {
        if (state is IsSignedIn) route = Routes.informationPage;
      }, builder: (context, state) {
        if (state is IsSignedIn)
          return Home(navigatorKey: navigatorKey, route: route);
        else if (state is DatabaseError)
          return  Home(navigatorKey: navigatorKey, route: route);
        else
          return MaterialApp(home: Scaffold(body: Center(child: CircularProgressIndicator())));
      } ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key key,
    @required this.navigatorKey,
    @required this.route,
  }) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey;
  final String route;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
