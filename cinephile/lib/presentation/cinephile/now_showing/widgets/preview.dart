import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:cinephile/presentation/cinephile/now_showing/widgets/header.dart';
import 'package:cinephile/presentation/core/heros/hero_preview.dart';
import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:cinephile/presentation/core/widgets/back_container.dart';
import 'package:cinephile/presentation/core/widgets/video_player.dart';
import 'package:flutter/material.dart';

class MoviePreview extends StatelessWidget {
  final int index;
  final Movie movie;
  const MoviePreview({
    Key? key,
    required this.movie,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultWidth * 2),
      child: Stack(
        children: [
          Hero(
              flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                return HeroPreview(
                    animation: animation, flightDirection: flightDirection);
              },
              tag: 'HeroID.make(HeroType.)$index',
              child: const BackContainer(
                showBorder: true,
                child: SizedBox.expand(),
                color: Colors.black,
              )),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.defaultHeight * 3,
                horizontal: SizeConfig.defaultWidth * 3),
            child: Column(
              children: [
                Hero(
                  tag: 'image $index',
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.defaultHeight * 3),
                    child: Container(
                      height: SizeConfig.defaultHeight * 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.defaultHeight * 3),
                          border: Border.all(color: Colors.red, width: 3)),
                      child: BetterPlayerWidget(
                        url: movie.movieUrl,
                        image: movie.previewUrl,
                      ),
                      // child: Image.asset(
                      //   movie.imageUrl,
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.defaultHeight),
                Opacity(
                  opacity: 1,
                  child: MovieHeader(
                    movie: movie,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
