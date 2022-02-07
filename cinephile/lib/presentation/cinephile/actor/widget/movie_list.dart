import 'dart:math';

import 'package:cinephile/application/core/enums.dart';
import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:cinephile/presentation/cinephile/movie/widget/category_chips.dart';
import 'package:cinephile/presentation/cinephile/movie/widget/rating_info.dart';
import 'package:cinephile/presentation/core/heros/hero_id.dart';
import 'package:flutter/material.dart';

class HorizontalMovieList extends StatelessWidget {
  final List<Movie> movies;
  final String name;

  const HorizontalMovieList(
      {Key? key, required this.movies, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _imageHeight = 180;

    return SizedBox(
      height: 250,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // print(index);
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   Movie movie = movies[index];
              //   return MovieDetailsPage(
              //       movie: movie, HeroTag: HeroTag.make(movie.id, name));
              // }));
            },
            child: Container(
              width: _imageHeight * 0.8,
              margin: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: HeroTag.make(HeroGroup.buttonNavBar, index: index),
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        width: _imageHeight * 0.7,
                        height: _imageHeight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(0, 4),
                                  blurRadius: 6)
                            ]),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage(
                              image: AssetImage(movies[index].imageUrl),
                              fit: BoxFit.cover,
                              placeholder:
                                  const AssetImage('assets/images/loading.gif'),
                            ))),
                  ),
                  Text(movies[index].name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class VerticalMovieList extends StatelessWidget {
  final List<Movie> movies;
  final String name;

  const VerticalMovieList(this.movies, this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   Movie movie = movies[index];
              //   return MovieDetailsPage(
              //       movie: movie, HeroTag: HeroTag.make(movie.id, name));
              // }));
            },
            child: SizedBox(
              height: 170,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Card(
                      color: Theme.of(context).cardColor,
                      child: Container(
                        margin: const EdgeInsets.only(left: 125, right: 10),
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              movies[index].name,
                              style: Theme.of(context).textTheme.bodyText2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: RatingInformation(
                                  movie: movies[index], alingCenter: false),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  ': ',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  movies[index].name,
                                  style: Theme.of(context).textTheme.bodyText2,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 8,
                    child: Hero(
                      tag: HeroTag.make(HeroGroup.buttonNavBar, index: index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black54,
                                  offset: Offset(0, 4),
                                  blurRadius: 6)
                            ]),
                        width: 100,
                        height: 140,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage(
                            image: NetworkImage(movies[index].imageUrl),
                            fit: BoxFit.cover,
                            placeholder:
                                const AssetImage('assets/images/loading.gif'),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MovieCoverFlow extends StatefulWidget {
  final List<Movie> movies;

  const MovieCoverFlow(this.movies, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MovieCoverFlowState();
  }
}

class MovieCoverFlowState extends State<MovieCoverFlow> {
  late double currentPage;
  var _visible = true;
  int _pageIndex = 0;
  // Future<Map<int, String>> genresMapFuture;

  @override
  Widget build(BuildContext context) {
    PageController controller =
        PageController(initialPage: widget.movies.length - 1);

    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;

        if (currentPage - currentPage.toInt() == 0) {
          _visible = true;
          _pageIndex = currentPage.toInt();
        } else {
          _visible = false;
        }
      });
    });

    return InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   Movie movie = widget.movies[currentPage.round()];
          //   return MovieDetailsPage(
          //       movie: movie, HeroTag: HeroTag.make(movie.id, 'box_office'));
          // }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 250),
                    child: Hero(
                        tag: HeroTag.make(
                          HeroGroup.buttonNavBar,
                        ),
                        child:
                            BackDropImage(widget.movies[_pageIndex].coverUrl))),
                Container(
                    padding: const EdgeInsets.only(top: 70),
                    child: CardControllWidget(currentPage, widget.movies)),
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: widget.movies.length,
                    controller: controller,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Container();
                    },
                  ),
                )
              ],
            ),
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 250),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.movies[_pageIndex].name,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      RatingInformation(
                          movie: widget.movies[_pageIndex], alingCenter: true),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: CategoryChips(
                            genres: widget.movies[_pageIndex].genres),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}

class CardControllWidget extends StatelessWidget {
  var currentPage;
  final padding = 10.0;
  final verticalInset = 40.0;
  final List<Movie> movieDataList;

  final cardAspectRatio = 12.0 / 16.0;
  late double widgetAspectRatio;

  CardControllWidget(this.currentPage, this.movieDataList, {Key? key})
      : super(key: key) {
    widgetAspectRatio = cardAspectRatio * 1.2;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;

          var safeWidth = width - 2 * padding;
          var safeHeight = height - 2 * padding;

          var heightOfPrimaryCard = safeHeight;
          var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          var primaryCardLeft = safeWidth - widthOfPrimaryCard;
          var horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = [];

          for (var i = 0; i < movieDataList.length; i++) {
            var delta = i - currentPage;
            bool isOnRight = delta > 0;

            var start = padding +
                max(
                    primaryCardLeft -
                        horizontalInset * -delta * (isOnRight ? 15 : 1),
                    0.0);

            var cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: Hero(
                tag: HeroTag.make(HeroGroup.buttonNavBar),
                child: Container(
                  margin: const EdgeInsets.only(top: 60),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0, 4),
                            blurRadius: 6)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: AspectRatio(
                      aspectRatio: cardAspectRatio,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          FadeInImage(
                            image: NetworkImage(movieDataList[i].imageUrl),
                            fit: BoxFit.cover,
                            placeholder:
                                const AssetImage('assets/images/loading.gif'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        },
      ),
    );
  }
}

class BackDropImage extends StatelessWidget {
  final String imageUrl;

  const BackDropImage(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black, Colors.transparent],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: FadeInImage(
        width: double.infinity,
        height: 200,
        image: NetworkImage(imageUrl),
        fit: BoxFit.cover,
        placeholder: const AssetImage('assets/images/loading.gif'),
      ),
    );
  }
}
