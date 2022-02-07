import 'package:flutter/widgets.dart';

// TODO Remove Size_Config and use Responsive_Size.
class SizeConfig {
  static double widthInPx = 1080;
  static double heightInPx = 1920;
  static double defaultSize = 21;
  static late MediaQueryData _mediaQueryData;
  static late double pixelRatio;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultHeight;
  static late double defaultWidth;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    pixelRatio = _mediaQueryData.devicePixelRatio;
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    defaultHeight = defaultSize * screenHeight / heightInPx;
    defaultWidth = defaultSize * screenWidth / widthInPx;
  }
}


// TODO Add calculation for pixel_Ratio and for calculating Responsive Font size, radius.
extension ReponsiveSize on num {
  static const double _defaultSize = 21;
  static late MediaQueryData _mediaQueryData;
  static late double _pixelRatio,
      _screenWidth,
      _screenHeight,
      _widthInPx,
      _heightInPx;

  init(BuildContext context, {double? width, double? height}) {
    _mediaQueryData = MediaQuery.of(context);
    _pixelRatio = _mediaQueryData.devicePixelRatio;
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
    _heightInPx = height ?? 1920;
    _widthInPx = width ?? 1080;
  }

  double h() => (this / _heightInPx) * _screenHeight;
  double w() => (this / _widthInPx) * _screenWidth;
  double defaultHeight() => _screenHeight * this;
  double defaultWeight() => _screenWidth * this;
}

class Responsive extends StatelessWidget {
  final Widget child;
  final double? screenWidth, screenHeight;
  const Responsive(
      {Key? key, required this.child, this.screenHeight, this.screenWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReponsiveSize(0).init(context, width: screenWidth, height: screenHeight);

    return SizedBox(
      child: child,
    );
  }
}
