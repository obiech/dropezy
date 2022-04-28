import 'package:flex/domain/entity/image.dart';
import 'package:flutter/material.dart';

class Preview extends StatefulWidget {
  final Photo photo;
  const Preview({Key? key, required this.photo}) : super(key: key);

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white))),
      body: Center(
          child: Container(
              key: const Key('network_image_for_preview'),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                widget.photo.url,
              ))))),
    );
  }
}
