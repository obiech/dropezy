import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:cinephile/presentation/cinephile/actor/widget/movie_list.dart';
import 'package:flutter/material.dart';

class MoviesListPage extends StatelessWidget {
  final Future<List<Movie>> movies;
  final String title;

  const MoviesListPage({Key? key, required this.title, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const <Widget>[],
      ),
      body: FutureBuilder<List<Movie>>(
          future: movies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return VerticalMovieList(snapshot.data!, 'vertical_list');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
