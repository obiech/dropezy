import 'package:cinephile/presentation/cinephile/actor/widget/movie_list.dart';
import 'package:flutter/material.dart';

class MovieSearchPage extends SearchDelegate<String> {
  var result;

  @override
  ThemeData appBarTheme(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return themeData;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return [
      IconButton(
          icon: Icon(Icons.clear, color: themeData.iconTheme.color),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        color: themeData.iconTheme.color,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (result != null && result.isNotEmpty) {
      return VerticalMovieList(result, 'search');
    }
    return Container();
    // return VerticalMovieList(snapshot.data, 'search');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    result = null;

    return Container(
      color: themeData.backgroundColor,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.search,
            size: 55,
          ),
          const SizedBox(
            height: 10,
          ),
          Text('Translations.of(context).trans(transKeySearchMovieMessage)',
              style: themeData.textTheme.bodyText2)
        ],
      )),
    );
  }
}
