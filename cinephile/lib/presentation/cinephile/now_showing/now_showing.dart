import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinephile/application/carousel/carousel_indicator_cubit.dart';
import 'package:cinephile/application/core/enums.dart';
import 'package:cinephile/application/now_showing/now_showing_cubit.dart';
import 'package:cinephile/presentation/cinephile/movie/movie.dart';
import 'package:cinephile/presentation/cinephile/now_showing/widgets/carouse.dart';
import 'package:cinephile/presentation/cinephile/now_showing/widgets/genre_builder.dart';
import 'package:cinephile/presentation/cinephile/now_showing/widgets/linked_page.dart';
import 'package:cinephile/presentation/cinephile/now_showing/widgets/movie_grid.dart';
import 'package:cinephile/presentation/cinephile/now_showing/widgets/preview.dart';
import 'package:cinephile/presentation/core/routes/fade_transition.dart';
import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:cinephile/presentation/core/widgets/back_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowShowing extends StatefulWidget {
  final int currentIndex;

  const NowShowing({Key? key, this.currentIndex = 0}) : super(key: key);
  @override
  _NowShowingState createState() => _NowShowingState();
}

class _NowShowingState extends State<NowShowing> {
  ScrollController controller = ScrollController();
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      scroll();
    });
  }

  void scroll() {
    controller.animateTo(200,
        duration: const Duration(milliseconds: 5000), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        controller: controller,
        child: BlocBuilder<NowShowingCubit, NowShowingState>(
          builder: (context, state) {
            if (state.status == Status.success) {
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        height: SizeConfig.screenHeight,
                        child: LinkedPageView(
                          itemCount: state.movies.length,
                          backViewBuilder: (index) => Image.asset(
                            state.movies[index].imageUrl,
                            fit: BoxFit.fill,
                          ),
                          frontViewBuilder: (index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadeRoute(
                                        transitionTime:
                                            const Duration(seconds: 1),
                                        reverseTransitionTime:
                                            const Duration(seconds: 1),
                                        page: MovieDetail(
                                            movie: state.movies[index],
                                            index: index)));
                              },
                              child: MoviePreview(
                                index: index,
                                movie: state.movies[index],
                              )),
                        ),
                      ),
                      // Header(),
                      Positioned(
                        bottom: SizeConfig.defaultHeight * 2,
                        child: SizedBox(
                          width: SizeConfig.screenWidth * 0.5,
                          child: const Center(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Carousel(
                    movies: state.movies,
                    controller: _controller,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: state.movies.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () {
                          _controller.animateToPage(entry.key);
                          context
                              .read<CarouselIndicatorCubit>()
                              .changeIndex(entry.key);
                        },
                        child: BlocBuilder<CarouselIndicatorCubit,
                            CarouselIndicatorState>(
                          builder: (context, state) {
                            return Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red.withOpacity(
                                      state.index == entry.key ? 0.9 : 0.4)),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GenreBuilder(genre: state.genres),
                  const SizedBox(
                    height: 50,
                  ),
                  Grid(movies: state.movies),
                  const Hero(
                    tag: 'HeroID.make(HeroType.buttonNavBar)',
                    child: BackContainer(
                      height: 100,
                      color: Colors.black,
                      child: SizedBox.expand(),
                    ),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator.adaptive();
            }
          },
        ),
      ),
    );
  }
}
