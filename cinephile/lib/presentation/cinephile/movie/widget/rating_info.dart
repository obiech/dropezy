import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:flutter/material.dart';

class RatingInformation extends StatelessWidget {
  final Movie movie;
  final bool alingCenter;
  const RatingInformation({
    Key? key,
    required this.movie,
    required this.alingCenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    var numbericRating = Text(movie.rate.toString(),
        style: textTheme.bodyText2?.copyWith(color: Colors.white));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:
          alingCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: <Widget>[
        numbericRating,
        const SizedBox(
          width: 10.0,
        ),
        Icon(
          Icons.star,
          color: theme.colorScheme.secondary,
        ),
      ],
    );
  }
}
