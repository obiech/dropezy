import 'package:cinephile/domain/now_showing/model/actor.dart';
import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:cinephile/infrastructure/now_showing_impl/entity/actor_entity.dart';

class MovieEntity extends Movie {
  const MovieEntity({
    required final String name,
    required final String imageUrl,
    required final String coverUrl,
    required final String summary,
    required final String director,
    required final String previewUrl,
    required final String trailerUrl,
    required final String movieUrl,
    required final List<String> genres,
    required final double rate,
    required final int id,
    required final List<Actor> cast,
  }) : super(
            genres: genres,
            rate: rate,
            cast: cast,
            coverUrl: coverUrl,
            id: id,
            trailerUrl: trailerUrl,
            name: name,
            imageUrl: imageUrl,
            summary: summary,
            director: director,
            previewUrl: previewUrl,
            movieUrl: movieUrl);

  factory MovieEntity.fromJson(Map<String, dynamic> json) {
    return MovieEntity(
        id: json["id"],
        name: json["name"] ?? '',
        imageUrl: json["imageUrl"] ?? '',
        coverUrl: json["coverUrl"] ?? "",
        summary: json["summary"] ?? '',
        cast: json["cast"] != null
            ? (json["cast"] as List)
                .map((i) => ActorEntity.fromJson(i).toModel())
                .toList()
            : [const Actor.empty()],
        director: json['director'] ?? '',
        genres: json['genres'] ?? '',
        movieUrl: json['movieUrl'] ?? '',
        previewUrl: json['previewUrl'] ?? '',
        trailerUrl: json['trailerUrl'] ?? '',
        rate: json['rate'] ?? '');
  }
  Movie toModel() {
    return Movie(
      id: id,
      rate: rate,
      trailerUrl: trailerUrl,
      movieUrl: movieUrl,
      genres: genres,
      previewUrl: previewUrl,
      name: name,
      director: director,
      imageUrl: imageUrl,
      coverUrl: coverUrl,
      summary: summary,
      cast: cast,
    );
  }
}
