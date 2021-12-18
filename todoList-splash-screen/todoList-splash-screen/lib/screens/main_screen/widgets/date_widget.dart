// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

// Project imports:
import 'package:to_do_list_pro_project/resources/icons.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/date_listview.dart';
import 'package:to_do_list_pro_project/theme/color_theme.dart';
import 'package:to_do_list_pro_project/theme/themes.dart';

class DateWidget extends StatefulWidget {


  @override
  _DateWidgetState createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  bool _showContent = true;

  List<String> listOfMonths = [
    "January",
    "Febuary",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  late DateFormat dateFormat;


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
                child: Row(
                  children: [
                    SvgPicture.asset(_showContent
                        ? MainIcons.close
                        : MainIcons.open),
                    const SizedBox(width: 10.0),
                    Text(
                      DateTime.now().day.toString()+ ' ${listOfMonths[DateTime.now().month - 1]},  ' +DateTime.now().year.toString(),
                      style: TextStyles.dateStyle.copyWith(color: ColorPalette.purple1),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    _showContent = !_showContent;
                  });
                },
              )

            ],
          ),
          _showContent
              ? DateListView()
              : Offstage(),
        ],
      ),
    );
  }
}
