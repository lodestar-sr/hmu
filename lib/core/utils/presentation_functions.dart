import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';

void buttonChanger(BuildContext context, Color backgroundColor, Color textColor,
    double bottomMargin) {
  BlocProvider.of<ButtonBloc>(context).add(ChangeButton(
      backgroundColor: backgroundColor,
      textColor: textColor,
      bottomMargin: bottomMargin));
}
