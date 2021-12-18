// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:multi_charts/multi_charts.dart';
import 'package:to_do_list_pro_project/data/models/chart_model.dart';

// Project imports:
import 'package:to_do_list_pro_project/screens/main_screen/widgets/painter.dart';
import 'package:to_do_list_pro_project/theme/color_theme.dart';

class WheelRadarChart extends StatefulWidget {
  final ChartModel model;
  const WheelRadarChart({Key? key, required this.model}) : super(key: key);

  @override
  _WheelRadarChartState createState() => _WheelRadarChartState();
}

class _WheelRadarChartState extends State<WheelRadarChart> {
  var a = 213.0;
  var b = 113.0;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: ShapePainter(8, 100, 0),
        child: Listener(
          onPointerMove: ((_) {
            setState(() {
              print(_.localPosition.direction);
              a -= _.delta.dx;
              b -= _.delta.dy;
            });
          }),
          child: GestureDetector(
            onVerticalDragUpdate: ((_) {
              setState(() {
                // a -= _.localPosition.dx.toDouble();
              });
              // print(a);
            }),
            child: RadarChart(
              values: [100, 12, 14 , 100.2, 6.4, 7.3, 5.6, 6],
              labels: [
                "5.2\nBrightness of life",
                "8\nMaterial",
                "4.7\nHealth",
                "4.2\nCareer",
                "6.4\nFamily, friends",
                "7.3\nRelationship",
                "5.6\nFinance",
                "6\nSelf-development",
              ],
              maxWidth: 300.0,
              maxHeight: 300.0,
              labelColor: ColorPalette.black1,
              fillColor: Colors.deepPurple[800]!,
              maxValue: 215,
              strokeColor: Colors.white,
              animate: false,

              chartRadiusFactor: 0.7,
              // strokeColor: Colors.black
            ),
          ),
        ));
  }
}
