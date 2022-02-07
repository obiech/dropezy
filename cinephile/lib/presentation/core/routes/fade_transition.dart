import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder {
  final Duration transitionTime;
  final Duration reverseTransitionTime;
  final Widget page;
  FadeRoute(
      {required this.page,
      required this.transitionTime,
      required this.reverseTransitionTime})
      : super(
          transitionDuration: transitionTime,
          reverseTransitionDuration: reverseTransitionTime,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
