import 'package:cinephile/application/core/enums.dart';
import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:cinephile/presentation/cinephile/movie/widget/arc_banner.dart';
import 'package:cinephile/presentation/core/heros/hero_id.dart';
import 'package:flutter/material.dart';

class MovieDetailHeaderWidget extends StatefulWidget {
  final Movie movie;
  final int index;

  const MovieDetailHeaderWidget(
      {Key? key, required this.movie, required this.index})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieDetailHeaderState();
  }
}

class _MovieDetailHeaderState extends State<MovieDetailHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 170.0),
          child: Hero(
              tag: HeroTag.make(HeroGroup.pageView, index: widget.index),
              child: ArcBannerImage(widget.movie.coverUrl)),
        ),
      ],
    );
  }
}
