// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:to_do_list_pro_project/data/models/sub_tasks.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/expanded_settings.dart';
import 'package:to_do_list_pro_project/utils/global_state.dart' as global;

class TaskBottomSheet extends StatefulWidget {
  @override
  _TaskBottomSheetState createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  TextEditingController taskController = TextEditingController();

  bool showExpandedSettings = false;

  GlobalKey<FormState> _formKey = GlobalKey();

  List<SubTask> addSubtasks() {
    List<SubTask> subtasks = [];
    if (global.store.get('subtask1') != null) {
      subtasks.add(SubTask(title: global.store.get('subtask1')));
    }
    if (global.store.get('subtask2') != null) {
      subtasks.add(SubTask(title: global.store.get('subtask2')));
    }
    return subtasks;
  }

  void clearStore() {
    global.store.set('subtask1', null);
    global.store.set('subtask2', null);
    global.store.set('category', null);
    global.store.set('periodChoose', null);
    global.store.set('isReminded', null);
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            ExpandedSettings(),
          ],
        ),
      ),
    );
  }
}
