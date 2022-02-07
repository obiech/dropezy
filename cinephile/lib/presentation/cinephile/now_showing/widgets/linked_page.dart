import 'dart:math';

import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:flutter/material.dart';

class LinkedPageView extends StatefulWidget {
  final Function(int) backViewBuilder;
  final Function(int) frontViewBuilder;
  final int itemCount;

  const LinkedPageView(
      {Key? key,
      required this.backViewBuilder,
      required this.frontViewBuilder,
      required this.itemCount})
      : super(key: key);
  @override
  _LinkedPageViewState createState() => _LinkedPageViewState();
}

class _LinkedPageViewState extends State<LinkedPageView> {
  PageController backPageController = PageController();
  PageController frontPageController = PageController(viewportFraction: 0.7);
  double currentPage = 0;

  @override
  void initState() {
    super.initState();
    frontPageController.addListener(() {
      currentPage = frontPageController.page!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      SizedBox(
        height: SizeConfig.screenHeight,
        child: PageView.builder(
          controller: backPageController,
          itemCount: widget.itemCount,
          reverse: true,
          // pageSnapping: false,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => widget.backViewBuilder(index),
        ),
      ),
      SizedBox(
        height: SizeConfig.screenHeight * 0.7,
        child: SizedBox(
            child: PageView.builder(
          controller: frontPageController,
          itemCount: widget.itemCount,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (value) {
            backPageController.jumpTo(frontPageController.offset / 0.7);
            setState(() {});
          },
          itemBuilder: (context, index) {
            return Transform.translate(
              offset: Offset(0, (currentPage - index).abs() * 50),
              child: Opacity(
                  opacity: max(
                      (1 - (currentPage - index).abs() * 0.5).toDouble(), 0.75),
                  child: widget.frontViewBuilder(index)),
            );
          },
        )),
      ),
    ]);
  }
}
