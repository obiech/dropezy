import 'package:cinephile/application/core/enums.dart';
import 'package:cinephile/domain/now_showing/model/actor.dart';
import 'package:cinephile/presentation/core/heros/hero_id.dart';
import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:cinephile/presentation/core/widgets/frame.dart';
import 'package:flutter/material.dart';

class CrewList extends StatelessWidget {
  final List<Actor> crews;

  const CrewList({required this.crews, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h(),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: crews.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: HeroTag.make(HeroGroup.crew, index: index),
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: 270.w(),
                      height: 400.h(),
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
                          child: Frame(
                            child: FadeInImage(
                              image: AssetImage(crews[index].imageUrl),
                              fit: BoxFit.fill,
                              placeholder:
                                  const AssetImage('assets/images/loading.gif'),
                            ),
                          ))),
                ),
                Text(crews[index].name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.white)),
              ],
            ),
          );
        },
      ),
    );
  }
}
