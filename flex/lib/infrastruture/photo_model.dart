import 'package:flex/domain/entity/image.dart';

class PhotoModel extends Photo {
  const PhotoModel(String url) : super(url);

  factory PhotoModel.fromValue(String url) {
    return PhotoModel(url);
  }
  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(json['url']);
  }

  Map<String, dynamic> toJson() {
    return {'url': url};
  }
}
