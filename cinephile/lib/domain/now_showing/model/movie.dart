import 'package:cinephile/domain/now_showing/model/actor.dart';

class Movie {
  final int id;
  final String name,
      imageUrl,
      coverUrl,
      summary,
      director,
      previewUrl,
      trailerUrl,
      movieUrl;
  final List<String> genres;
  final double rate;
  final List<Actor> cast;

  const Movie({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.coverUrl,
    required this.summary,
    required this.director,
    required this.genres,
    required this.movieUrl,
    required this.previewUrl,
    required this.trailerUrl,
    required this.rate,
    required this.cast,
  });

  const Movie.empty()
      : id = 0,
        name = "",
        imageUrl = "",
        coverUrl = "",
        summary = "",
        director = "",
        genres = const [''],
        previewUrl = "",
        movieUrl = "",
        trailerUrl = "",
        rate = 0,
        cast = const [Actor.empty()];
}
