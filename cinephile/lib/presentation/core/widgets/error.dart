import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorBuilder extends StatelessWidget {
  final String errMessage;
  const ErrorBuilder({Key? key, this.errMessage = 'Unknown Error.'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 140.0,
          width: 140.0,
          child: SvgPicture.asset(
            "assets/icons/warning.svg",
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        Text(
          errMessage,
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
