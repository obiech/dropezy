import 'package:cinephile/presentation/cinephile/movie/widget/clipper.dart';
import 'package:cinephile/presentation/core/widgets/frame.dart';
import 'package:flutter/material.dart';

class ArcBannerImage extends StatelessWidget {
  final String imageUrl;
  const ArcBannerImage(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sreenWidth = MediaQuery.of(context).size.width;

    dynamic image;

    if (imageUrl.isEmpty) {
      image = Image.asset(
        'assets/images/loading.gif',
        fit: BoxFit.fill,
      );
    } else {
      image = FadeInImage(
        image: AssetImage(imageUrl),
        fit: BoxFit.fill,
        placeholder: const AssetImage('assets/images/loading.gif'),
      );
    }

    return SizedBox(
      width: sreenWidth,
      height: 500,
      child: image,
    );
  }
}
