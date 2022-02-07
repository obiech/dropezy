// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:to_do_list_pro_project/blocs/task_list_bloc/task_list_bloc.dart';
import 'package:to_do_list_pro_project/utils/global_state.dart' as global;

class DateListView extends StatefulWidget {
  @override
  _DateListViewState createState() => _DateListViewState();
}

class _DateListViewState extends State<DateListView> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 365; //For Horizontal Date
  ScrollController scrollController = ScrollController(
      initialScrollOffset: 17500); //To Track Scroll of ListView

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  DateTime calenderDate = DateTime(
      DateTime.now().year, DateTime.now().month - 12, DateTime.now().day);

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    print(calenderDate);
    return Container(
        height: 52,
        child: Container(
            child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 10);
          },
          itemCount: 1000,
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  currentDateSelectedIndex = index;
                  selectedDate = DateTime.now().add(Duration(days: index));
                  global.store.set('selectedDate', selectedDate);
                  BlocProvider.of<TaskListBloc>(context)
                    ..add(TaskListLoadEvent());
                });
              },
              child: Container(
                height: 51,
                width: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: currentDateSelectedIndex == index
                        ? Color(0xFF7D63EB)
                        : Colors.white),
                child: Center(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        listOfDays[calenderDate.add(Duration(days: index)).weekday -
                                    1]
                                .toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: currentDateSelectedIndex == index
                                ? Colors.white
                                : Colors.black),
                      ),
                      Text(calenderDate.add(Duration(days: index)).day.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: currentDateSelectedIndex == index
                                ? Colors.white
                                : Colors.black),)
                    ],
                  ),
                ),
              ),
            );
          },
        )));
  }
}