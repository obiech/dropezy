part of 'carousel_indicator_cubit.dart';

class CarouselIndicatorState extends Equatable {
  final int index;
  const CarouselIndicatorState(this.index);

  @override
  List<Object> get props => [index];

  CarouselIndicatorState copyWith(int? index) {
    return CarouselIndicatorState(index ?? this.index);
  }

  factory CarouselIndicatorState.initial() {
    return const CarouselIndicatorState(0);
  }
}
