// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:to_do_list_pro_project/data/models/goal_model.dart';

class GoalListData {
  List<GoalModel> _goals = [
  ];

  List<GoalModel> get goals => _goals;

  void addGoal(GoalModel goal) {
    _goals.add(goal);
  }

  void removeGoal(GoalModel goal) {
    _goals.remove(goal);
  }
}
