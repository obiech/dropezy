import 'package:equatable/equatable.dart';

 class User extends Equatable {
  final int id;
  final String name;
  final String url;

  const User(this.id, this.name, this.url);

  @override
  List<Object> get props => [id, name, url];

  const User.empty()
      : id = 0,
        name = "",
        url = "";
}
