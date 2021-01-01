part of 'button_bloc.dart';

abstract class ButtonState extends Equatable {
  const ButtonState();
  @override
  List<Object> get props => [];
}

class ButtonInitial extends ButtonState {}

class ButtonChanged extends ButtonState {
  final Color textColor;
  final Color backgroundColor;
  final double bottomMargin;

  ButtonChanged({
    @required this.backgroundColor,
    @required this.textColor,
    @required this.bottomMargin,
  });

  @override
  List<Object> get props => [backgroundColor, textColor, bottomMargin];
}

class IndexAndTextChanged extends ButtonState {
  final int index;
  final String text;
  IndexAndTextChanged({@required this.index, @required this.text});
  List<Object> get props => [index, text];
}

class ToggleButtonIndexChanged extends ButtonState {
  final int index;
  final bool value;
  ToggleButtonIndexChanged({@required this.index, this.value});
  List<Object> get props => [index, value];
}

class SwitcherChanged extends ButtonState {
  final bool value;
  SwitcherChanged({@required this.value});
  @override
  List<Object> get props => [value];
}
