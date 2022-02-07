import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:cinephile/presentation/core/widgets/back_container.dart';
import 'package:flutter/material.dart';

class HeroNavBar extends StatelessWidget {
  const HeroNavBar({
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
              ? Curves.ease.transform(animation.value)
              : Curves.ease.transform(animation.value);
          return Align(
            alignment: Alignment.bottomCenter,
            child: BackContainer(
              color: Colors.black,
              height: (0.7).defaultHeight() * (1 + value),
              child: const SizedBox.expand(),
            ),
          );
        });
  }
}
