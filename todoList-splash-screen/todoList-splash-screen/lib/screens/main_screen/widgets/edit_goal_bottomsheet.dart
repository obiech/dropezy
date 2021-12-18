// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:to_do_list_pro_project/blocs/goal_list_bloc/goal_list_bloc.dart';
import 'package:to_do_list_pro_project/components/apply_button.dart';
import 'package:to_do_list_pro_project/data/models/category_model.dart';
import 'package:to_do_list_pro_project/data/models/goal_model.dart';
import 'package:to_do_list_pro_project/data/models/sub_tasks.dart';
import 'package:to_do_list_pro_project/resources/resources.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/goal_expanded_settings.dart';
import 'package:to_do_list_pro_project/utils/global_state.dart' as global;
import 'package:to_do_list_pro_project/utils/helper.dart';

class EditGoalBottomsheet extends StatefulWidget {
  final GoalModel goal;

  EditGoalBottomsheet({required this.goal});

  @override
  _EditGoalBottomsheetState createState() => _EditGoalBottomsheetState();
}

class _EditGoalBottomsheetState extends State<EditGoalBottomsheet> {

  TextEditingController goalController = TextEditingController();

  bool showExpandedSettings = false;

  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController titleController = TextEditingController();
  Helper helper = Helper();

  void clearStore() {
    // global.store.set('subtask1', null);
    global.store.set('selectedDay', null);
    global.store.set('calendar', null);
    global.store.set('category', null);
    global.store.set('periodChoose', null);
    global.store.set('isReminded', null);
  }

  List<SubTask> subtasks = [];

  bool isNotEmpty1 = false;
  bool isNotEmpty2 = false;
  bool isSwitched = false;

  List dates = [
    'Среда, 12 мая 2021',
    'Четверг, 13 мая 2021',
    'Пятница, 14 мая 2021',
  ];

  List periods = [
    'Дней',
    'Недель',
    'Месяцев',
  ];

  List<CategoryModel> categories = [];

  late String dateChoose;
  late String periodChoose;
  late CategoryModel category;

  @override
  void initState() {
    categories = global.store.get('categoryList');
    titleController.text = widget.goal.title!;
    dateChoose = dates[0];
    periodChoose = periods[0];
    category = categories[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.only(
          top: 44,
          bottom: 50,
          left: 30,
          right: 30,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              GoalExpandedSettings(
                  titleController: titleController, goal: widget.goal),
              const SizedBox(height: 10),
              ApplyButton(
                  title: Strings.apply,
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        global.store.get('selectedDay') != null) {
                      widget.goal.title = titleController.text;
                      widget.goal.calendar =
                          global.store.get('selectedDay').toString();
                      widget.goal.category =
                          global.store.get('Goal category') ?? 'All';
                      widget.goal.isRemind =
                          ((global.store.get('Goal isReminded') == false)
                              ? 0
                              : 1);
                      widget.goal.isCompleted = 1;
                      widget.goal.term = helper.daysBetween(
                          global.store.get('selectedDay').toString());
                      BlocProvider.of<GoalListBloc>(context)
                        ..add(EditGoalEvent(
                            goal: widget.goal));
                      Navigator.pop(context);
                      clearStore();
                    }
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
