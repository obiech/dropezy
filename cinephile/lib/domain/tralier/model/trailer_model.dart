import 'package:cinephile/domain/tralier/model/user_model.dart';
import 'package:cinephile/domain/tralier/model/video_model.dart';
import 'package:equatable/equatable.dart';

class Trailer extends Equatable {
  final int id;
  final int width;
  final int height;
  final String image;
  final int duration;
  final User user;
  final List<Video> videos;

  const Trailer(this.id, this.width, this.height, this.image, this.duration,
      this.user, this.videos);
  @override
  List<Object> get props => [id, width, height, image, duration, user, videos];

  const Trailer.empty()
      : id = 0,
        width = 0,
        height = 0,
        image = "",
        duration = 0,
        user = const User.empty(),
        videos = const [Video.empty()];
}
