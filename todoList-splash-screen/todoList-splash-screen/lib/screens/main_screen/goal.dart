// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:to_do_list_pro_project/resources/resources.dart';
import 'package:to_do_list_pro_project/screens/advertisement_screen/screen.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/categories_list_row.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/draggable_button.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/drawer_widget.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/goal_task_bottom_sheet.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/long_term.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/medium_term.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/short_term.dart';
import 'package:to_do_list_pro_project/theme/color_theme.dart';
import 'package:to_do_list_pro_project/theme/text_theme.dart';

// import 'package:to_do_list_pro_project/screens/main_screen/widgets/database/squlite.dart';

class Screen2 extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorPalette.white1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  child: SvgPicture.asset(
                    MainIcons.menu,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Text(
                Strings.goals,
                style: TextStyles.header3.copyWith(color: ColorPalette.black1),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AdvertisementScreen()));
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  child: SvgPicture.asset(
                    MainIcons.brilliant,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CategoriesListRow(),
              const SizedBox(height: 20),
              ShortTerm(),
              const SizedBox(height: 20),
              MediumTerm(),
              const SizedBox(height: 20),
              LongTerm(),
            ],
          ),
        ),
      ),
      floatingActionButton: Stack(
        children: [
          DraggableFloatingActionButton(
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: ColorPalette.purple1,
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return Wrap(
                        children: [
                          BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: GoalTaskBottomSheet()),
                        ],
                      );
                    });
              },
              child: SvgPicture.asset(MainIcons.plus),
            ),
            initialOffset: Offset(MediaQuery.of(context).size.width / 2,
               MediaQuery.of(context).size.height- (MediaQuery.of(context).size.height/5) ),
            parentKey: _scaffoldKey,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
