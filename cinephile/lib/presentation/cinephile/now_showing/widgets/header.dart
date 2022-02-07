import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:cinephile/presentation/cinephile/now_showing/widgets/genre.dart';
import 'package:cinephile/presentation/cinephile/now_showing/widgets/rate.dart';
import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:flutter/material.dart';

class MovieHeader extends StatelessWidget {
  final Movie movie;

  const MovieHeader({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          movie.name,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: SizeConfig.defaultHeight),
        MovieGenres(
          genres: movie.genres,
        ),
        SizedBox(height: SizeConfig.defaultHeight),
        MovieRate(
          rate: movie.rate,
        )
      ],
    );
  }
}
