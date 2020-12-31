part of 'button_bloc.dart';

abstract class ButtonEvent extends Equatable {
  const ButtonEvent();
}

class ChangeButton extends ButtonEvent {
  final Color textColor;
  final Color backgroundColor;
  final double bottomMargin;

  ChangeButton(
      {@required this.backgroundColor,
      @required this.textColor,
      @required this.bottomMargin});
  @override
  List<Object> get props => [backgroundColor, textColor, bottomMargin];
}

class ChangeIndexAndText extends ButtonEvent {
  final String text;
  final int index;
  ChangeIndexAndText({@required this.index, @required this.text});
  List<Object> get props => [index, text];
}

class ChangeToggleButtonIndex extends ButtonEvent {
  final int index;
  final bool value;
  ChangeToggleButtonIndex({@required this.index, this.value});
  List<Object> get props => [index, value];
}
