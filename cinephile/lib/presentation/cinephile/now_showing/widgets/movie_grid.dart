import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:cinephile/presentation/cinephile/movie/movie.dart';
import 'package:cinephile/presentation/core/routes/fade_transition.dart';
import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:cinephile/presentation/core/widgets/frame.dart';
import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  final List<Movie> movies;
  const Grid({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 950.h(),
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 0, crossAxisSpacing: 20),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      FadeRoute(
                          transitionTime: const Duration(seconds: 2),
                          reverseTransitionTime: const Duration(seconds: 2),
                          page:
                              MovieDetail(movie: movies[index], index: index)));
                },
                child: Container(
                  color: Colors.red,
                  child: ClipRRect(
                    child: Frame(
                      child: Image.asset(
                        movies[index].imageUrl,
                        fit: BoxFit.fill,
                        width: 390.w(),
                        height: 390.h(),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 180.w(),
                child: Text(
                  movies[index].name.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'muli',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.star,
                    color: Colors.red,
                    size: 14,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.red,
                    size: 14,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.red,
                    size: 14,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.red,
                    size: 14,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.red,
                    size: 14,
                  ),
                  SizedBox(
                    width: 20.w(),
                  ),
                  Text(
                    movies[index].rate.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
