import 'package:cinephile/domain/tralier/model/trailer_model.dart';
import 'package:cinephile/presentation/core/theming/size_config.dart';

import 'package:cinephile/presentation/core/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Feed extends StatefulWidget {
  final List<Trailer> data;
  const Feed({Key? key, required this.data}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final PageController _controller = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageView.builder(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: (1 / 15).defaultHeight(),
                      bottom: (1 / 8).defaultHeight()),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(36),
                      color: Colors.black),
                  child: SizedBox(
                      width: size.width,
                      child: BetterPlayerWidget(
                          url: widget.data[index].videos[0].link,
                          image: widget.data[index].image)),
                ),
                Positioned(
                  left: 18.0.w(),
                  bottom: 32.0.h(),
                  child: SafeArea(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 130.0.h(),
                            width: 130.0.w(),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.0, color: Colors.red),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        NetworkImage(widget.data[index].image),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            widget.data[index].user.name,
                            style: const TextStyle(
                                fontSize: 16.0, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 5.0,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        widget.data[index].user.url,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  )),
                ),
                Positioned(
                    right: 12.0,
                    bottom: (size.height / 8) + size.height / 20,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_outlined,
                                size: 35.0, color: Colors.white)),
                        const SizedBox(
                          height: 10.0,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Ionicons.chatbubble_outline,
                                size: 30.0, color: Colors.white)),
                        const SizedBox(
                          height: 10.0,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Ionicons.paper_plane_outline,
                                size: 30.0, color: Colors.white))
                      ],
                    )),
              ],
            ),
          );
        });
  }
}
