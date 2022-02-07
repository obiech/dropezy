import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinephile/application/carousel/carousel_indicator_cubit.dart';
import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:cinephile/presentation/core/routes/fade_transition.dart';
import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:cinephile/presentation/core/widgets/frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Carousel extends StatefulWidget {
  final CarouselController controller;
  final List<Movie> movies;
  const Carousel({
    Key? key,
    required this.movies,
    required this.controller,
  }) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: widget.controller,
      itemCount: widget.movies.length,
      itemBuilder: (BuildContext context, int index, int _) {
        return GestureDetector(
          onTap: () {
            // Navigator.push(
            //     context,
            //     FadeRoute(
            //       transitionTime: const Duration(seconds: 1),
            //       reverseTransitionTime: const Duration(seconds: 1),
            //       page: MovieDetailsPage(
            //           movie: widget.movies[1],
            //           heroID: widget.movies[1].name,
            //           index: 10000),
            //     ));
            // );
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              ClipRRect(
                child: Frame(
                  child: Image.asset(
                    widget.movies[index].imageUrl,
                    fit: BoxFit.fill,
                    width: SizeConfig.screenWidth,
                    height: SizeConfig.screenHeight / 3,
                  ),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 15,
                  left: 15,
                ),
                child: Text(
                  widget.movies[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'muli',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
      options: CarouselOptions(
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 15),
          autoPlayAnimationDuration: const Duration(milliseconds: 1800),
          pauseAutoPlayOnTouch: true,
          viewportFraction: 0.6,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            BlocProvider.of<CarouselIndicatorCubit>(context).changeIndex(index);
          }),
    );
  }
}
