import 'package:cinephile/application/buttom_nav_bar/buttomnavbar_cubit.dart';
import 'package:cinephile/application/carousel/carousel_indicator_cubit.dart';
import 'package:cinephile/application/now_showing/now_showing_cubit.dart';
import 'package:cinephile/application/trailer/trailer_cubit.dart';
import 'package:cinephile/presentation/core/theming/size_config.dart';
import 'package:cinephile/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => TrailerCubit()..getTrailer()),
      BlocProvider(create: (context) => NowShowingCubit()..getMovies()),
      BlocProvider(
          create: (context) => CarouselIndicatorCubit()..changeIndex(0)),
      BlocProvider(create: (context) => ButtomnavbarCubit())
    ],
    child: const Cinephile(),
  ));
}

class Cinephile extends StatelessWidget {
  const Cinephile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Responsive(
        child: HomeScreen(),
      ),
    );
  }
}
