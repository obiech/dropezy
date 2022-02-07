import 'package:cinephile/domain/tralier/model/trailer_model.dart';
import 'package:cinephile/domain/tralier/model/user_model.dart';
import 'package:cinephile/domain/tralier/model/video_model.dart';
import 'package:cinephile/infrastructure/trailer_impl/entity/user_model.dart';
import 'package:cinephile/infrastructure/trailer_impl/entity/video_entity.dart';

class TrailerEntity {
  final int id;
  final int width;
  final int height;
  final String image;
  final int duration;
  final User user;
  final List<Video> videos;

  const TrailerEntity(this.id, this.width, this.height, this.image,
      this.duration, this.user, this.videos);

  TrailerEntity.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        width = json["width"] ?? 0,
        height = json["height"] ?? 0,
        image = json["image"] ?? "",
        duration = json["duration"] ?? 0,
        user = json["user"] != null
            ? (UserEntity.fromJson(json["user"]).toModel())
            : const User.empty(),
        videos = json["video_files"] != null
            ? (json["video_files"] as List)
                .map((i) => VideoEntity.fromJson(i).toModel())
                .toList()
            : [];
  Trailer toModel() {
    return Trailer(id, width, height, image, duration, user, videos);
  }
}
