// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:to_do_list_pro_project/blocs/percentage_bloc/percentage_bloc.dart';
import 'package:to_do_list_pro_project/data/models/chart_model.dart';

// Project imports:
import 'package:to_do_list_pro_project/resources/resources.dart';
import 'package:to_do_list_pro_project/screens/advertisement_screen/screen.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/drawer_widget.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/wheel_line_chart.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/wheel_radar_chart.dart';
import 'package:to_do_list_pro_project/theme/color_theme.dart';
import 'package:to_do_list_pro_project/theme/text_theme.dart';

class Screen1 extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  get isShowingMainData => false;

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
                  width: 40,
                  height: 40.0,
                  child: SvgPicture.asset(
                    MainIcons.menu,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Text(
                Strings.wheels,
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
          child: BlocBuilder<PercentageBloc, PercentageState>(
            builder: (context, state) {
              if (state is PercentageLoaded) {
                int length = state.percentageModel!.isEmpty? 0: 0;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    WheelRadarChart(model: state.percentageModel![length]),
                    const SizedBox(height: 20),
                    percentage(state.percentageModel![length]),
                    const SizedBox(height: 20),
                    WheelLineChart(),
                    const SizedBox(height: 40),
                    testButton(),
                    const SizedBox(height: 10),
                    Text(
                      'Recommended to take place once a month',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xff878787)),
                    )
                  ],
                );
              } else
                return Offstage(
                  child: Container(),
                );
            },
          ),
        ),
      ),
    );
  }

  Widget percentage(ChartModel model) {
    double percent = (model.brightness! +
            model.career! +
            model.family! +
            model.finance! +
            model.health! +
            model.material! +
            model.relationship!) /
        80;
    return SizedBox(
      width: 151,
      height: 56,
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 27,
                lineWidth: 3.5,
                animation: true,
                animationDuration: 3000,
                percent: 0.7,
                animateFromLastPercent: true,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Color(0xFF7D63EB),
              ),
              SizedBox(
                width: 9,
              ),
              RichText(
                  text: TextSpan(
                      text: '59',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 27),
                      children: [
                    TextSpan(
                        text: '%\nHappiness',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 12))
                  ])),
            ],
          )),
    );
  }

  Widget testButton() {
    return Container(
        width: 255,
        height: 40,
        child: Center(
            child: Text('To pass a test',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ))),
        decoration: BoxDecoration(
            color: Color(0xFF7D63EB),
            borderRadius: BorderRadius.all(Radius.circular(15))));
  }
}
