// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:to_do_list_pro_project/data/models/goal_model.dart';
import 'package:to_do_list_pro_project/resources/icons.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/short_term_goal_widget.dart';
import 'package:to_do_list_pro_project/theme/color_theme.dart';
import 'package:to_do_list_pro_project/theme/themes.dart';

class ShortTerm extends StatefulWidget {
  late final GoalModel goal;

  @override
  _ShortTermState createState() => _ShortTermState();
}

class _ShortTermState extends State<ShortTerm> {
  bool _showContent = true;

  late DateFormat dateFormat;

  @override
  void initState() {
    super.initState();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                child: Container(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          _showContent ? MainIcons.close : MainIcons.open),
                      const SizedBox(width: 10.0),
                      Text(
                        'Краткосрочные',
                        style: TextStyles.dateStyle
                            .copyWith(color: ColorPalette.purple1),
                      ),
                    ],
                  ),
                  height: 40.0,
                ),
                onTap: () {
                  setState(() {
                    _showContent = !_showContent;
                  });
                },
              )
            ],
          ),
          _showContent ? ShortTermGoalWidget() : Offstage(),
        ],
      ),
    );
  }
}
