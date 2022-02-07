import 'dart:developer';

import 'package:cinephile/application/buttom_nav_bar/buttomnavbar_cubit.dart';
import 'package:cinephile/application/core/enums.dart';
import 'package:cinephile/presentation/cinephile/favorite/favorite.dart';
import 'package:cinephile/presentation/cinephile/now_showing/now_showing.dart';
import 'package:cinephile/presentation/cinephile/trailer/trailer.dart';
import 'package:cinephile/presentation/core/heros/hero_id.dart';
import 'package:cinephile/presentation/core/heros/hero_nav_bar.dart';
import 'package:cinephile/presentation/core/theming/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ButtomnavbarCubit, ButtomnavbarState>(
            builder: (context, state) {
          switch (state.item) {
            case NavBarItem.home:
              return const TrailerScreen();
            case NavBarItem.favourite:
              return const NowShowing();
            case NavBarItem.plus:
              return Container();
            case NavBarItem.search:
              return Container();
            case NavBarItem.profile:
              return Container();
            default:
              return Container();
          }
        }),
        bottomNavigationBar: Hero(
          tag: HeroTag.make(HeroGroup.buttonNavBar),
          flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) =>
              HeroNavBar(
                  animation: animation, flightDirection: flightDirection),
          child: Container(
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
            child: BlocBuilder<ButtomnavbarCubit, ButtomnavbarState>(
              builder: (context, state) {
                return BottomNavigationBar(
                  backgroundColor: Colors.black,
                  elevation: 0.9,
                  iconSize: 21,
                  unselectedFontSize: 10.0,
                  selectedFontSize: 10.0,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: state.item.index,
                  onTap: (_) =>
                      context.read<ButtomnavbarCubit>().selectedItem(_),
                  items: [
                    BottomNavigationBarItem(
                      label: "Home",
                      icon: SizedBox(
                        child: SvgPicture.asset(
                          "assets/icons/home.svg",
                          color: Colors.white,
                          height: 25.0,
                          width: 25.0,
                        ),
                      ),
                      activeIcon: SizedBox(
                        child: SvgPicture.asset(
                          "assets/icons/home-active.svg",
                          color: CinephileColors.mainColor,
                          height: 25.0,
                          width: 25.0,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Discover",
                      icon: SvgPicture.asset(
                        "assets/icons/search.svg",
                        color: Colors.white,
                        height: 25.0,
                        width: 25.0,
                      ),
                      activeIcon: SizedBox(
                        child: SvgPicture.asset(
                          "assets/icons/search-active.svg",
                          color: CinephileColors.mainColor,
                          height: 25.0,
                          width: 25.0,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Liked",
                      icon: SvgPicture.asset(
                        "assets/icons/heart.svg",
                        color: Colors.white,
                        height: 25.0,
                        width: 25.0,
                      ),
                      activeIcon: SizedBox(
                        child: SvgPicture.asset(
                          "assets/icons/heart-active.svg",
                          color: CinephileColors.mainColor,
                          height: 25.0,
                          width: 25.0,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Trending",
                      icon: SvgPicture.asset(
                        "assets/icons/trend.svg",
                        color: Colors.white,
                        height: 25.0,
                        width: 25.0,
                      ),
                      activeIcon: SizedBox(
                        child: SvgPicture.asset(
                          "assets/icons/trend-active.svg",
                          color: CinephileColors.mainColor,
                          height: 25.0,
                          width: 25.0,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Profile",
                      icon: SvgPicture.asset(
                        "assets/icons/profile.svg",
                        color: Colors.white,
                        height: 25.0,
                        width: 25.0,
                      ),
                      activeIcon: SizedBox(
                        child: SvgPicture.asset(
                          "assets/icons/profile-active.svg",
                          color: CinephileColors.mainColor,
                          height: 25.0,
                          width: 25.0,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
