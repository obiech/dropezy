import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:cinephile/presentation/core/widgets/frame.dart';
import 'package:flutter/material.dart';

class Poster extends StatelessWidget {
  final String imageUrl;
  const Poster({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: 450.w(),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black54, offset: Offset(0, 4), blurRadius: 6)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Frame(
            child: FadeInImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
              placeholder: const AssetImage('assets/images/loading.gif'),
            ),
          ),
        ));
  }
}
