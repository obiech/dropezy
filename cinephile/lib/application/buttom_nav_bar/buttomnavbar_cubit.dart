import 'package:bloc/bloc.dart';
import 'package:cinephile/application/core/enums.dart';
import 'package:equatable/equatable.dart';

part 'buttomnavbar_state.dart';

class ButtomnavbarCubit extends Cubit<ButtomnavbarState> {
  ButtomnavbarCubit() : super(ButtomnavbarState.initial());


  void selectedItem(int index) {
    switch (index) {
      case 0:
        emit(state.copyWith(NavBarItem.home));
        break;
      case 1:
        emit(state.copyWith(NavBarItem.favourite));
        break;
      case 2:
        emit(state.copyWith(NavBarItem.plus));
        break;
      case 3:
        emit(state.copyWith(NavBarItem.search));
        break;
      case 4:
        emit(state.copyWith(NavBarItem.profile));
        break;
      default:
        emit(state.copyWith(NavBarItem.home));
    }
  }
}
