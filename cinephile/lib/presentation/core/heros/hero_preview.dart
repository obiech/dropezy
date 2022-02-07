import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:cinephile/presentation/core/widgets/back_container.dart';
import 'package:flutter/material.dart';

class HeroPreview extends StatelessWidget {
  const HeroPreview({
    Key? key,
    required this.animation,
    required this.flightDirection,
  }) : super(key: key);

  final Animation animation;
  final HeroFlightDirection flightDirection;

  @override
  Widget build(BuildContext context) {
    final isPop = flightDirection == HeroFlightDirection.pop;
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final value = isPop
              ? Curves.easeInBack.transform(animation.value)
              : Curves.ease.transform(animation.value);
          return SizedBox(
              width: (1.defaultHeight()) * (1 + (0.7 * (value))),
              child: const BackContainer(
                color: Colors.black,
                child: SizedBox.expand(),
              ));
        });
  }
}
