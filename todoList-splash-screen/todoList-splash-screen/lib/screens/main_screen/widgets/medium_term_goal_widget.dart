// Dart imports:
import 'dart:developer';
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:to_do_list_pro_project/blocs/goal_list_bloc/goal_list_bloc.dart';
import 'package:to_do_list_pro_project/data/models/goal_model.dart';
import 'package:to_do_list_pro_project/screens/main_screen/widgets/edit_goal_bottomsheet.dart';
import 'package:to_do_list_pro_project/theme/color_theme.dart';
import 'package:to_do_list_pro_project/theme/text_theme.dart';
import 'package:to_do_list_pro_project/utils/global_state.dart' as global;
import 'goal_slidable_widget.dart';

class MediumTermGoalWidget extends StatelessWidget {
  _showMaterialDialog(BuildContext context, GoalModel goal) {
    showDialog(
        context: context,
        builder: (_) => Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.pop(context);
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Wrap(
                          children: [
                            BackdropFilter(
                                filter:
                                ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: EditGoalBottomsheet(
                                  goal: goal,
                                )),
                          ],
                        );
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: ColorPalette.grey7,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 10),
                    child: Text(
                      'Редактировать',
                      style: TextStyles.subtitle5.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorPalette.black1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<GoalListBloc>(context)
                      .add(RemoveGoalEvent(goal: goal));
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: ColorPalette.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 25),
                    child: Text(
                      'Удалить',
                      style: TextStyles.subtitle5.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ColorPalette.black1,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GoalListBloc, GoalListState>(
      builder: (context, state) {
        if (state is GoalListLoading) {
          log(state.toString(),name: 'loading');
          return Padding(
            padding: EdgeInsets.only(top: 200),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is GoalListLoaded) {
          log(state.toString(),name: 'loaded');
          log(state.currentGoals.length.toString()+ 'hghdfhweihfiwe', name: 'goalstateloaded');
          if (state.currentGoals.length == 0 &&
              state.completedGoals.length == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Center(
                child: Text(
                  'Добавьте первую Цели SMART',
                  style:
                  TextStyles.subtitle1.copyWith(color: ColorPalette.grey1),
                ),
              ),
            );
          }
          return Column(
            children: [

              termGenerator(state.mediumTerm,global.store.get('categoryName')),
              const SizedBox(height: 20),

              // state.completedGoals.isNotEmpty
              //     ? CompletedGoalList(completedGoals: state.completedGoals)
              //     : Offstage(),
            ],
          );
        } else if (state is GoalListError) {
          return Center(
            child: Text('Error'),
          );
        } else {
          return Offstage();
        }
      },
    );
  }

  ListView termGenerator(List<GoalModel> state, String categoryName) {
    if (categoryName != 'All')
    state = state.where((element) => element.category == categoryName).toList();
    return ListView.builder(
        itemCount: state.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = state[index];
          return GestureDetector(
            onLongPress: () {
              _showMaterialDialog(
                context,
                state[index],
              );
            },
            child: GoalSlidableWidget(
              //Key for sliding items
              key: ObjectKey(item),
              goal: state[index],
              color: Color(0xffFFA15E),
            ),
          );
        });
  }

// CompletedGoalList({required List<GoalModel> completedGoals}) {}
}
