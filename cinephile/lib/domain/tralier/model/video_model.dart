import 'package:equatable/equatable.dart';

 class Video extends Equatable {
  final int id;
  final String quality;
  final String link;

  const Video(this.id, this.quality, this.link);

  @override
  List<Object> get props => [id, quality, link];

  const Video.empty()
      : id = 0,
        quality = "",
        link = "";
}
