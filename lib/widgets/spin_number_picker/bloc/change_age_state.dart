part of 'change_age_bloc.dart';

abstract class ChangeAgeState extends Equatable {
  final int age;
  const ChangeAgeState({@required this.age});

  @override
  List<Object> get props => [age];
}

class ChangeAgeInitial extends ChangeAgeState {}

class AgeChanged extends ChangeAgeState {
  AgeChanged(int age) : super(age: age);
}
