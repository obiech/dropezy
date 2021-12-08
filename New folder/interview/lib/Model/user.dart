import 'package:equatable/equatable.dart';

class User extends Equatable {
  String? password;

  @override
  List<Object> get props => [];

  User({
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'password': password,
    };
  }

  User.fromOject(
    dynamic o,
  ) {
    this.password = o["password"];
  }
}
