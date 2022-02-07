import 'package:cinephile/application/core/enums.dart';

class HeroTag {
  static String make(HeroGroup group, {int index = 0}) {
    return 'hero_${group}_$index';
  }
}
