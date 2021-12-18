import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_list_pro_project/data/models/chart_model.dart';
import 'package:to_do_list_pro_project/database/squlite.dart';

part 'percentage_event.dart';
part 'percentage_state.dart';

class PercentageBloc extends Bloc<PercentageEvent, PercentageState> {
  PercentageBloc() : super(PercentageInitial());
  DbHelper db = DbHelper();

  @override
  Stream<PercentageState> mapEventToState(PercentageEvent event) async* {
    if (event is ReloadPercentage) {
      yield PercentageInitial();
      try {
        yield PercentageLoaded(
          percentageModel: (await db.getDocsChart()),
        );
      } catch (e) {
        yield PercentageError();
        log(e.toString());
      }
    }
  }
}
