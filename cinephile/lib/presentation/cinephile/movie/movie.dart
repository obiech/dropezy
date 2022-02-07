import 'package:cinephile/application/core/enums.dart';
import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:cinephile/presentation/cinephile/actor/actor.dart';
import 'package:cinephile/presentation/cinephile/movie/widget/cast_list.dart';
import 'package:cinephile/presentation/cinephile/movie/widget/category_chips.dart';
import 'package:cinephile/presentation/cinephile/movie/widget/crew.dart';
import 'package:cinephile/presentation/cinephile/movie/widget/custom_back_buton.dart';
import 'package:cinephile/presentation/cinephile/movie/widget/header.dart';
import 'package:cinephile/presentation/cinephile/movie/widget/poster.dart';
import 'package:cinephile/presentation/cinephile/movie/widget/rating_info.dart';
import 'package:cinephile/presentation/cinephile/movie/widget/story_line.dart';
import 'package:cinephile/presentation/core/heros/hero_id.dart';
import 'package:cinephile/presentation/core/routes/fade_transition.dart';
import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:cinephile/presentation/core/widgets/back_container.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie;
  final int index;
  const MovieDetail({Key? key, required this.movie, required this.index})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MovieDetailState();
  }
}

class _MovieDetailState extends State<MovieDetail> {
  late Future<Map<int, String>> genresMapFuture;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            MovieDetailHeaderWidget(movie: widget.movie, index: widget.index),
            Align(
              alignment: Alignment.bottomCenter,
              child: Hero(
                tag: HeroTag.make(HeroGroup.buttonNavBar),
                child: BackContainer(
                  color: Colors.black,
                  height: (0.7).defaultHeight(),
                  child: const SizedBox.expand(),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 250.h(),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 30.w(),
                    ),
                    Hero(
                      tag: HeroTag.make(HeroGroup.preview, index: widget.index),
                      child: Poster(
                        imageUrl: widget.movie.imageUrl,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.movie.name,
                            style: (textTheme.bodyText2
                                ?.copyWith(color: Colors.white)),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          RatingInformation(
                            movie: widget.movie,
                            alingCenter: false,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'll : ',
                                style: textTheme.bodyText2
                                    ?.copyWith(color: Colors.white),
                              ),
                              Text(widget.movie.name,
                                  style: textTheme.bodyText2
                                      ?.copyWith(color: Colors.white))
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          SizedBox(
                            height: 70.h(),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: CategoryChips(
                                genres: widget.movie.genres,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 30.w()),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        StoryLine(widget.movie),
                        SizedBox(
                          height: 25.h(),
                        ),
                        Text(
                          'Director',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CrewList(crews: widget.movie.cast),
                        Text(
                          'Crews',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  FadeRoute(
                                      transitionTime:
                                          const Duration(seconds: 1),
                                      reverseTransitionTime:
                                          const Duration(seconds: 1),
                                      page: ActorProfile(
                                          actor: widget.movie.cast[1],
                                          heroID: '[',
                                          id: widget.movie.cast[1].id)));
                            },
                            // onTap: Navigator.push(context,MaterialPageRoute(builder: (context)=> ActorProfile()),
                            child: CastList(casts: widget.movie.cast)),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h(), left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[CustomBackButton()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
