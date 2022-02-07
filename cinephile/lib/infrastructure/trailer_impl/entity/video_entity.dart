import 'package:cinephile/domain/tralier/model/video_model.dart';

class VideoEntity {
  final int id;
  final String quality, link;
  const VideoEntity(this.id, this.quality, this.link);

  Map<String, dynamic> toMap(Video model) {
    return {'id': model.id, 'quality': model.quality, 'link': model.link};
  }

  factory VideoEntity.fromJson(Map<String, dynamic> json) {
    return VideoEntity(
        json['id'], json['quality'] ?? '', json['link'] ?? '');
  }

  Video toModel() {
    return Video(id, quality, link);
  }
}