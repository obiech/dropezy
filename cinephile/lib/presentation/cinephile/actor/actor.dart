import 'package:cinephile/domain/now_showing/model/actor.dart';
import 'package:cinephile/domain/now_showing/model/actor.dart';
import 'package:cinephile/presentation/cinephile/actor/widget/movie_list.dart';
import 'package:cinephile/presentation/cinephile/movie/widget/custom_back_buton.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ActorProfile extends StatefulWidget {
  ///TODO REMOVE id.
  final int id;
  final Actor actor;
  final String heroID;

  const ActorProfile(
      {Key? key, required this.id, required this.actor, required this.heroID})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ActorProfileState();
  }
}

class _ActorProfileState extends State<ActorProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Hero(
              tag: widget.heroID,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: FadeInImage(
                  width: double.infinity,
                  height: 450,
                  image: AssetImage(widget.actor.imageUrl),
                  fit: BoxFit.cover,
                  placeholder: const AssetImage('assets/images/loading.gif'),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                  padding: const EdgeInsets.only(top: 450),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    color: Theme.of(context).backgroundColor.withOpacity(0.3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.actor.name,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        DetailProfileWidget(widget.actor),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                            'Translations.of(context).trans(transKeyBiography)',
                            style: Theme.of(context).textTheme.bodyText2),
                        const SizedBox(
                          height: 20,
                        ),
                        // HorizontalMovieList(
                        //   movies: widget.movi,
                        // )
                      ],
                    ),
                  )),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 5, top: 10),
                child: CustomBackButton()),
          ],
        ),
      ),
    );
  }
}

class DetailProfileWidget extends StatefulWidget {
  final Actor actor;

  const DetailProfileWidget(this.actor, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailProfileWidgetState();
  }
}

class DetailProfileWidgetState extends State<DetailProfileWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('${widget.actor.birthday}, ${widget.actor.placeOfBirth} '),
        const SizedBox(
          height: 20,
        ),
        ExpandablePanel(
          header: Text('Translations.of(context).trans(transKeyKnowFor)',
              style: theme.bodyText2),
          collapsed: Text(widget.actor.knownForDepartment,
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: theme.bodyText2),
          expanded: Text(widget.actor.birthday,
              softWrap: true, style: theme.bodyText2),
          // tapHeaderToExpand: true,
          // hasIcon: true,
        ),
      ],
    );
  }
}
