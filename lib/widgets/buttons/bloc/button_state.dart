part of 'button_bloc.dart';

abstract class ButtonState extends Equatable {
  final Color textColor;
  final Color backgroundColor;
  final double bottomMargin;
  const ButtonState(
      {@required this.textColor,
      @required this.backgroundColor,
      @required this.bottomMargin});

  @override
  List<Object> get props => [backgroundColor, textColor, bottomMargin];
}

class ButtonInitial extends ButtonState {}

class ButtonChanged extends ButtonState {
  ButtonChanged(
      {@required Color backgroundColor,
      @required Color textColor,
      @required double bottomMargin})
      : super(
            backgroundColor: backgroundColor,
            textColor: textColor,
            bottomMargin: bottomMargin);
}
