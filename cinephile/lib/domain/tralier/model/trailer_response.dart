import 'package:cinephile/domain/tralier/model/trailer_model.dart';

abstract class FeedResponse {
  final List<Trailer> feeds;
  // final String error;

  FeedResponse(this.feeds,);

 factory FeedResponse.fromJson(Map<String, dynamic> json) => throw UnimplementedError();
  // : feeds =
  //       (json["videos"] as List).map((i) => Trailer.fromJson(i)).toList(),
  //   error = "";

  // FeedResponse.withError(String errorValue)
  //     : feeds = [],
  //       error = errorValue;
}
