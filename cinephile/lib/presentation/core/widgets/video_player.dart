import 'dart:developer';

import 'package:better_player/better_player.dart';
import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:flutter/material.dart';

class BetterPlayerWidget extends StatefulWidget {
  final String url;
  final String image;
  final bool autoPlay;
  const BetterPlayerWidget(
      {Key? key, required this.url, required this.image, this.autoPlay = false})
      : super(key: key);

  @override
  _BetterPlayerStateWidget createState() => _BetterPlayerStateWidget();
}

class _BetterPlayerStateWidget extends State<BetterPlayerWidget> {
  late BetterPlayerController _betterPlayerController;

  void _initialiseController() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
            fit: BoxFit.fill,
            showPlaceholderUntilPlay: true,
            autoPlay: widget.autoPlay,
            placeholder: Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: NetworkImage(widget.image), fit: BoxFit.cover)),
            ),
            controlsConfiguration: const BetterPlayerControlsConfiguration(
                playerTheme: BetterPlayerTheme.cupertino,
                enablePlayPause: true,
                enableQualities: true,
                controlsHideTime: Duration(milliseconds: 300),
                enableProgressBar: true,
                enableFullscreen: true,
                enableSkips: true,
                enableRetry: true,
                enableOverflowMenu: true,
                enableProgressBarDrag: true,
                enableProgressText: true,
                overflowModalColor: Colors.white,
                enableSubtitles: true));
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, widget.url,
        cacheConfiguration:
            const BetterPlayerCacheConfiguration(useCache: true));
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController
      ..setupDataSource(dataSource)
      ..setOverriddenFit(BoxFit.fill)
      ..setOverriddenAspectRatio(0.75)
      ..setControlsEnabled(true)
      ..addEventsListener((event) {
        setState(() {});
        log("Better player event: ${event.betterPlayerEventType}");
      });
  }

  @override
  void initState() {
    _initialiseController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.fill,
        child: SizedBox(
          width: 1.defaultWeight(),
          child: BetterPlayer(controller: _betterPlayerController),
        ));
  }
}
