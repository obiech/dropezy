import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'carousel_indicator_state.dart';

class CarouselIndicatorCubit extends Cubit<CarouselIndicatorState> {
  CarouselIndicatorCubit() : super(CarouselIndicatorState.initial());

  void changeIndex(int index) => emit(state.copyWith(index));
}
