// @dart=2.9

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

// Project imports:
import 'package:to_do_list_pro_project/blocs/alert_cubit/cubit/alertcubit_cubit.dart';
import 'package:to_do_list_pro_project/blocs/category_list_bloc/category_list_bloc.dart';
import 'package:to_do_list_pro_project/blocs/goal_list_bloc/goal_list_bloc.dart';
import 'package:to_do_list_pro_project/blocs/percentage_bloc/percentage_bloc.dart';
import 'package:to_do_list_pro_project/blocs/task_list_bloc/task_list_bloc.dart';
import 'package:to_do_list_pro_project/blocs/time_cubit/timechange_cubit.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/savchits.dart';
import 'package:to_do_list_pro_project/utils/global_state.dart' as global;
import 'package:to_do_list_pro_project/utils/injection_container.dart';

void main() {
  setupInjections();
  initializeDateFormatting('ru');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    global.store.set('categoryName', 'All');
    global.store.set('selectedDate', DateTime.now());
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskListBloc()),
        BlocProvider(
            create: (context) =>
                CategoryListBloc(getIt())..add(CategoryListLoadEvent())),
        BlocProvider(
            create: (context) =>
                GoalListBloc(goalListRepo: getIt())..add(GoalListLoadEvent())),
        BlocProvider(create: (context) => TimechangeCubit()),
        BlocProvider(create:(context) => PercentageBloc()),
        BlocProvider(create: (context) => AlertcubitCubit()),
      ],
      child: MaterialApp(
        title: 'To Do List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Mont',
        ),
        home: SavchitsPage(),
      ),
    );
  }
}
