import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { width, radius, scale }

class LoadAnimation extends StatelessWidget {
  final CustomAnimationControl control;
  final Widget child;

  final _tween = MultiTween<AniProps>()
    ..add(
        AniProps.width,
        Tween(begin: SizeConfig.screenWidth, end: SizeConfig.defaultHeight * 6),
        const Duration(milliseconds: 400),
        Curves.easeInOut)
    ..add(AniProps.radius, Tween(begin: 0.0, end: 50.0),
        const Duration(milliseconds: 300), Curves.easeInOut)
    ..add(AniProps.scale, ConstantTween(1.0), const Duration(milliseconds: 600),
        Curves.easeIn)
    ..add(AniProps.scale, Tween(begin: 1.0, end: 35.0),
        const Duration(milliseconds: 400), Curves.easeIn);

  LoadAnimation({Key? key, required this.control, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAnimation(
      control: control,
      tween: _tween,
      duration: _tween.duration,
      builder: (context, child, MultiTweenValues<AniProps> value) =>
          Transform.scale(
        scale: value.get(AniProps.scale),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(value.get(AniProps.radius)),
          child: SizedBox(
            width: value.get(AniProps.width),
            child: child,
          ),
        ),
      ),
      child: child,
    );
  }
}
