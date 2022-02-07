import 'package:equatable/equatable.dart';

class Actor extends Equatable {
  final String name,
      imageUrl,
      placeOfBirth,
      birthday,
      creditID,
      knownForDepartment,
      gender,
      imdbID;
  final int id, popularity;
  final List<String> alsoKnownAs;

  const Actor(
      {required this.placeOfBirth,
      required this.birthday,
      required this.creditID,
      required this.knownForDepartment,
      required this.gender,
      required this.imdbID,
      required this.popularity,
      required this.alsoKnownAs,
      required this.id,
      required this.name,
      required this.imageUrl});

  Map<String, dynamic> toMap(Actor actor) {
    return {
      'id': actor.id,
      'name': actor.name,
      'imageUrl': actor.imageUrl,
      'placeOfBirth': actor.id,
      'creditID': actor.creditID,
      'birthday': actor.birthday,
      'alsoKnownAs': actor.alsoKnownAs,
      'imdbID': actor.imdbID,
      'popularity': actor.popularity,
      ' gender': actor.gender,
      'gender': actor.gender,
      'knownForDepartment': actor.knownForDepartment,
    };
  }

  const Actor.empty()
      : id = 0,
        name = "",
        placeOfBirth = '',
        creditID = '',
        imageUrl = "",
        birthday = '',
        alsoKnownAs = const [''],
        popularity = 0,
        imdbID = "",
        gender = '',
        knownForDepartment = "";

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
      ];
}
