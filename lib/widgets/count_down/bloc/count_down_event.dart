part of 'count_down_bloc.dart';

abstract class CountDownEvent extends Equatable {
  const CountDownEvent();

  @override
  List<Object> get props => [];
}

class StartCountDown extends CountDownEvent {}

class ChangeCountDown extends CountDownEvent {
  final int seconds;
  ChangeCountDown({@required this.seconds});
  @override
  List<Object> get props => [];
}
