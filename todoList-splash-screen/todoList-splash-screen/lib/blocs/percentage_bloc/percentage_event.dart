part of 'percentage_bloc.dart';

abstract class PercentageEvent extends Equatable {
  const PercentageEvent();

  @override
  List<Object> get props => [];
}

class ReloadPercentage extends PercentageEvent{}
