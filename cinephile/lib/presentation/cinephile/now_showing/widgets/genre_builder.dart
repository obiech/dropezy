import 'package:cinephile/presentation/core/widgets/frame.dart';
import 'package:flutter/material.dart';

class GenreBuilder extends StatelessWidget {
  final List<String> genre;
  const GenreBuilder({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            const VerticalDivider(
          color: Colors.transparent,
          width: 10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: genre.length,
        itemBuilder: (context, index) {
          final genres = genre[index];
          return Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 130,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: (index == 1) ? Colors.black45 : Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      genres.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: (index == 1) ? Colors.white : Colors.black45,
                        fontFamily: 'muli',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
