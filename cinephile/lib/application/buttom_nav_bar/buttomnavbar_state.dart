part of 'buttomnavbar_cubit.dart';

class ButtomnavbarState extends Equatable {
  final NavBarItem item;
  const ButtomnavbarState( this.item);

  @override
  List<Object> get props => [item];

  ButtomnavbarState copyWith(NavBarItem? item) {
    return ButtomnavbarState(item?? this.item);
  }

  factory ButtomnavbarState.initial() {
    return const ButtomnavbarState(NavBarItem.home);
  }
}
