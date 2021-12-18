part of 'percentage_bloc.dart';

abstract class PercentageState extends Equatable {
  const PercentageState();

  @override
  List<Object> get props => [];
}

class PercentageInitial extends PercentageState {}

class PercentageLoaded extends PercentageState {
  final List<ChartModel>? percentageModel;
  final double percent;
  PercentageLoaded({
    this.percentageModel,
    this.percent = 0.0
  });
}

class PercentageError extends PercentageState {}
