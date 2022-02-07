import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  final Widget child;
  const Frame({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // border: Border.all(color: Colors.red, width: 3),
          boxShadow: [
            BoxShadow(color: Colors.white, blurRadius: 50, offset: Offset(4, 4))
          ]),
      child: child,
    );
  }
}
