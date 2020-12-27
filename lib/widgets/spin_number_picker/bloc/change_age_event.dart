part of 'change_age_bloc.dart';

abstract class ChangeAgeEvent extends Equatable {
  final int age;
  const ChangeAgeEvent({@required this.age});

  @override
  List<Object> get props => [age];
}

class ChangeAge extends ChangeAgeEvent {
  ChangeAge(int age) : super(age: age);
}
