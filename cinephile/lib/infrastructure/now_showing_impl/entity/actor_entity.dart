import 'package:cinephile/domain/now_showing/model/actor.dart';

class ActorEntity extends Actor {
  const ActorEntity(
      {required String placeOfBirth,
      required String birthday,
      required String creditID,
      required String knownForDepartment,
      required String gender,
      required String imdbID,
      required int popularity,
      required List<String> alsoKnownAs,
      required int id,
      required String name,
      required String imageUrl})
      : super(
            placeOfBirth: placeOfBirth,
            birthday: birthday,
            creditID: creditID,
            knownForDepartment: knownForDepartment,
            gender: gender,
            imdbID: imdbID,
            popularity: popularity,
            alsoKnownAs: alsoKnownAs,
            id: id,
            name: name,
            imageUrl: imageUrl);

  @override
  List<Object> get props => [id, name, imageUrl];

  factory ActorEntity.fromJson(Map<String, dynamic> json) {
    return ActorEntity(
      id: json['id'],
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      alsoKnownAs: json['alsoKnownAs'] ?? '',
      creditID: json['creditID'] ?? '',
      gender: json['gender'] ?? '',
      birthday: json['birthday'] ?? '',
      knownForDepartment: json['knownForDepartment'] ?? '',
      placeOfBirth: json['placeOfBirth'] ?? '',
      popularity: json['popularity'] ?? '',
      imdbID: json['imdbID'] ?? '',
    );
  }

  Actor toModel() {
    return Actor(
        id: id,
        name: name,
        imageUrl: imageUrl,
        alsoKnownAs: alsoKnownAs,
        imdbID: imdbID,
        gender: gender,
        knownForDepartment: knownForDepartment,
        creditID: creditID,
        placeOfBirth: placeOfBirth,
        popularity: popularity,
        birthday: birthday);
  }
}
