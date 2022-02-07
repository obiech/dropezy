import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  final List<String> genres;

  const CategoryChips({
    Key? key,
    required this.genres,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: genres.map((genre) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => MoviesListPage(
                //         title:
                //             '} : genresMap[id]}',
                //         movies: MovieDBApi.getRelatedGenreMovies(id),
                //       ),
                //     ));
              },
              child: Chip(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      width: 1.5,
                      style: BorderStyle.solid,
                      color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                label: Text(genre),
                labelStyle: theme.caption,
                backgroundColor: Colors.white,
              ),
            ),
          );
        }).toList());
  }
}
