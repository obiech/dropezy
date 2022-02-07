import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:flutter/material.dart';

class BackContainer extends StatelessWidget {
  final Widget? child;
  final double height;
  final Color? color;
  final bool showBorder;

  const BackContainer(
      {Key? key,
      this.child,
      this.showBorder = false,
      this.height = double.infinity,
      this.color = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
            color: color,
            border:
                (showBorder) ? Border.all(color: Colors.red, width: 5) : null,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeConfig.defaultHeight * 4),
                topRight: Radius.circular(SizeConfig.defaultHeight * 4))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.defaultHeight * 3,
              horizontal: SizeConfig.defaultWidth * 3),
          child: child,
        ));
  }
}
