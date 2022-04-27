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
    return Center(
        child: Container(
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: NetworkImage(widget.photo.url)))));
  }
}
