import 'package:cinephile/domain/now_showing/model/movie.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class StoryLine extends StatelessWidget {
  final Movie movie;

  const StoryLine(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    String overview = movie.summary.isNotEmpty ? movie.summary : "상세 정보 없음";

    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ExpandablePanel(
            header: Text('Summary',
                style: textTheme.headline2?.copyWith(color: Colors.white)),
            collapsed: Text(overview,
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyText2?.copyWith(color: Colors.white)),
            expanded: Text(overview,
                softWrap: true,
                style: textTheme.bodyText2?.copyWith(color: Colors.white)),
            // tapHeaderToExpand: true,
            // hasIcon: true,
          ),
        ],
      ),
    );
  }
}
