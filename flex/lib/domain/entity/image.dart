import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final String url;

  const Photo(this.url);
  @override
  List<Object?> get props => [url];
}
