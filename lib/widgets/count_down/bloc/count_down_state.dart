part of 'count_down_bloc.dart';

abstract class CountDownState extends Equatable {
  const CountDownState();

  @override
  List<Object> get props => [];
}

class CountDownInitial extends CountDownState {}

class CountDownStarted extends CountDownState {}

class CountDownChanged extends CountDownState {
  final int seconds;
  CountDownChanged({@required this.seconds});
  @override
  List<Object> get props => [seconds];
}
