part of 'button_bloc.dart';

abstract class ButtonEvent extends Equatable {
  final Color textColor;
  final Color backgroundColor;
  final double bottomMargin;
  const ButtonEvent(
      {@required this.textColor,
      @required this.backgroundColor,
      @required this.bottomMargin});

  @override
  List<Object> get props => [backgroundColor, textColor, bottomMargin];
}

class ChangeButton extends ButtonEvent {
  ChangeButton(
      {@required Color backgroundColor,
      @required Color textColor,
      @required double bottomMargin})
      : super(
            backgroundColor: backgroundColor,
            textColor: textColor,
            bottomMargin: bottomMargin);
}
