// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:to_do_list_pro_project/data/models/sub_tasks.dart';
import 'package:to_do_list_pro_project/utils/helper.dart';

class ChartModel {
  int? brightness;
  int? material;
  int? health;
  int? career;
  int? family;
  int? relationship;
  int? finance;
  int? self;
  int? id;
  // DateTime? date;

  Helper helper = Helper();

  ChartModel({
    required this.brightness,
    required this.material,
    required this.family,
    required this.health,
    required this.career,
    required this.relationship,
    required this.self,
    required this.finance,
    // this.date,
  });
  Map<String, dynamic> toMap() {
    return {
      'material': material,
      'finance': finance,
      'brightness': brightness,
      'health': health,
      'id': id,
      'relationship': relationship,
      'family': family,
      'career':career,
      'self': self,
      // 'date': date
    };
  }

  ChartModel.fromOject(dynamic o, int index ) {
    this.material = o[index]["material"];
    this.finance = (o[index]["finance"]);
    this.brightness = o[index]["brightness"];
    this.health = o[index]['health'];
    this.id = o[index]['id'];
    this.relationship = (o[index]["relationship"]);
    this.family = (o[index]["family"]);
    this.career = (o[index]["career"]);
    // List a = jsonDecode(o[index]["self"]);
    this.self = (o[index]["self"]);
    // this.date = DateTime.parse(o[index]["date"]);
  }
  Map toJson() => {
        'self': self,
        'finance': finance,
      };
}
