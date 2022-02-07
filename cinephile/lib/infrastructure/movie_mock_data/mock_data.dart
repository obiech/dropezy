import 'package:cinephile/domain/now_showing/model/actor.dart';
import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:cinephile/domain/core/error.dart';
import 'package:cinephile/domain/now_showing/repo.dart';
import 'package:dartz/dartz.dart';

class MockData extends MoviesData {
  @override
  Future<Either<CinephileError, List<Movie>>> getMovies() async {
    try {
      final res = _movies;
      return Right(res.map((e) => e).toList());
    } catch (_) {
      return Left(CinephileError(_.toString()));
    }
  }

  final List<Movie> _movies = const [
    Movie(
        id: 1,
        name: "Greyhound",
        imageUrl: "assets/movies/greyhound.jpg",
        coverUrl: "assets/movies/greyhound_cover.jpg",
        summary:
            "Early in World War II, an inexperienced U.S. Navy captain must lead an Allied convoy being stalked by Nazi U-boat wolfpacks.",
        director: "Aaron Schneider",
        genres: ["Action", "Drama", "History"],
        rate: 7.1,
        movieUrl:
            'https://vod-progressive.akamaized.net/exp=1643866053~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F3409%2F21%2F542049887%2F2570565023.mp4~hmac=12bd582fbaebe25f5103df6cd1c7a4aaa40fdc28956544857330a9ab7a2b4ef0/vimeo-prod-skyfire-std-us/01/3409/21/542049887/2570565023.mp4?filename=pexels-ekaterina-bolovtsova-7669220.mp4',
        trailerUrl: 'https://www.pexels.com/video/woman-dancing-2873755/',
        previewUrl:
            "https://images.pexels.com/videos/3403285/free-video-3403285.jpg?auto=compress&cs=tinysrgb&fit=crop&h=630&w=1200",
        cast: [
          Actor(
              name: "Tom Hanks",
              imageUrl: "assets/cast/tom_hanks.jpg",
              id: 0,
              alsoKnownAs: [],
              birthday: '',
              creditID: '',
              imdbID: '',
              gender: '',
              knownForDepartment: '',
              placeOfBirth: '',
              popularity: 0),
          Actor(
              name: "Stephen Graham",
              imageUrl: "assets/cast/stephen_graham.jpg",
              id: 1,
              alsoKnownAs: [],
              birthday: '',
              creditID: '',
              imdbID: '',
              gender: '',
              knownForDepartment: '',
              placeOfBirth: '',
              popularity: 0),
          Actor(
              name: "Elisabeth Shue",
              imageUrl: "assets/cast/elisabeth_shue.jpg",
              id: 2,
              alsoKnownAs: [],
              birthday: '',
              creditID: '',
              imdbID: '',
              gender: '',
              knownForDepartment: '',
              placeOfBirth: '',
              popularity: 0),
        ]),
    Movie(
      id: 2,
      name: "Joker",
      imageUrl: "assets/movies/joker.jpg",
      coverUrl: "assets/movies/joker_cover.jpg",
      summary:
          "In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.",
      director: "Todd Phillips",
      genres: ["Crime", "Drama", "Thriller"],
      rate: 8.5,
      movieUrl:
          'https://vod-progressive.akamaized.net/exp=1643866011~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F3428%2F21%2F542143509%2F2571017132.mp4~hmac=1e190fd6ca2c47d2a10c5d13235370f15dcb452c0d112f0f8bff0b909a8f74ef/vimeo-prod-skyfire-std-us/01/3428/21/542143509/2571017132.mp4?filename=pexels-koolshooters-7673888.mp4',
      trailerUrl:
          'https://www.pexels.com/video/women-in-black-dresses-performing-ritual-dance-8208125/',
      previewUrl:
          'https://images.pexels.com/videos/5135860/pexels-photo-5135860.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=1200&w=630',
      cast: [
        Actor(
            name: "Joaquin Phoenix",
            imageUrl: "assets/cast/joaquin_phoenix.jpg",
            id: 3,
            alsoKnownAs: [],
            birthday: '',
            creditID: '',
            imdbID: '',
            gender: '',
            knownForDepartment: '',
            placeOfBirth: '',
            popularity: 0),
        Actor(
            name: "Robert De Niro",
            imageUrl: "assets/cast/robert_de_niro.jpg",
            id: 4,
            alsoKnownAs: [],
            birthday: '',
            creditID: '',
            imdbID: '',
            gender: '',
            knownForDepartment: '',
            placeOfBirth: '',
            popularity: 0),
        Actor(
            name: "Zazie Beetz",
            imageUrl: "assets/cast/zazie_beetz.jpg",
            id: 5,
            alsoKnownAs: [],
            birthday: '',
            creditID: '',
            imdbID: '',
            gender: '',
            knownForDepartment: '',
            placeOfBirth: '',
            popularity: 0),
      ],
    ),
    Movie(
        id: 3,
        name: "The Old Guard",
        imageUrl: "assets/movies/the_old_guard.jpg",
        coverUrl: "assets/movies/the_old_guard_cover.jpg",
        summary:
            "A covert team of immortal mercenaries are suddenly exposed and must now fight to keep their identity a secret just as an unexpected new member is discovered.",
        director: "Gina Prince-Bythewood",
        genres: ["Action", "Adventure", "Fantasy"],
        rate: 6.7,
        movieUrl:
            'https://vod-progressive.akamaized.net/exp=1643865945~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1017%2F15%2F380085290%2F1591934140.mp4~hmac=20e257a3161530dddac844cb55c2b392d71b2c2fc7d83350a23a460cb78cbeeb/vimeo-prod-skyfire-std-us/01/1017/15/380085290/1591934140.mp4?filename=video.mp4',
        trailerUrl:
            'https://www.pexels.com/video/woman-dancing-outdoors-modern-4734799/"',
        previewUrl:
            'https://images.pexels.com/videos/2795731/free-video-2795731.jpg?auto=compress&cs=tinysrgb&fit=crop&h=630&w=1200',
        cast: [
          Actor(
              name: "Charlize Theron",
              imageUrl: "assets/cast/charlize_theron.jpg",
              id: 7,
              alsoKnownAs: [],
              birthday: '',
              creditID: '',
              imdbID: '',
              gender: '',
              knownForDepartment: '',
              placeOfBirth: '',
              popularity: 0),
          Actor(
              name: "Kiki Layne",
              imageUrl: "assets/cast/kiki_layne.jpg",
              id: 6,
              alsoKnownAs: [],
              birthday: '',
              creditID: '',
              imdbID: '',
              gender: '',
              knownForDepartment: '',
              placeOfBirth: '',
              popularity: 0),
          Actor(
              name: "Matthias Schoenaerts",
              imageUrl: "assets/cast/matthias_schoenaerts.jpg",
              id: 8,
              alsoKnownAs: [],
              birthday: '',
              creditID: '',
              imdbID: '',
              gender: '',
              knownForDepartment: '',
              placeOfBirth: '',
              popularity: 0),
        ]),
    Movie(
        id: 4,
        name: "Hamilton",
        imageUrl: "assets/movies/hamilton.jpg",
        coverUrl: "assets/movies/hamilton_cover.jpg",
        summary:
            "The real life of one of America's foremost founding fathers and first Secretary of the Treasury, Alexander Hamilton. Captured live on Broadway from the Richard Rodgers Theater with the original Broadway cast.",
        director: "Thomas Kail",
        genres: ["Biography", "Drama", "History"],
        rate: 8.9,
        movieUrl:
            'https://vod-progressive.akamaized.net/exp=1643865874~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1421%2F14%2F357107012%2F1457548513.mp4~hmac=c61a03360153fe49358e827d1fb3784c84048420f73cfaae67f85ef04d1d33bb/vimeo-prod-skyfire-std-us/01/1421/14/357107012/1457548513.mp4?filename=video.mp4',
        trailerUrl: 'https://www.pexels.com/video/a-woman-dancing-7669220/',
        previewUrl:
            'https://images.pexels.com/videos/7669397/pexels-photo-7669397.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=630&w=1200',
        cast: [
          Actor(
              name: "Daveed Diggs",
              imageUrl: "assets/cast/daveed_diggs.jpg",
              id: 11,
              alsoKnownAs: [],
              birthday: '',
              creditID: '',
              imdbID: '',
              gender: '',
              knownForDepartment: '',
              placeOfBirth: '',
              popularity: 0),
          Actor(
              name: "Jonathan Groff",
              imageUrl: "assets/cast/jonathan_groff.jpg",
              id: 10,
              alsoKnownAs: [],
              birthday: '',
              creditID: '',
              imdbID: '',
              gender: '',
              knownForDepartment: '',
              placeOfBirth: '',
              popularity: 0),
          Actor(
              name: "Leslie Odom Jr.",
              imageUrl: "assets/cast/leslie_odom_jr.jpg",
              id: 9,
              alsoKnownAs: [],
              birthday: '',
              creditID: '',
              imdbID: '',
              gender: '',
              knownForDepartment: '',
              placeOfBirth: '',
              popularity: 0),
        ]),
  ];
}
