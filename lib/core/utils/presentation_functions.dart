import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';

void buttonChanger(
  BuildContext context,
  Color backgroundColor,
  Color textColor,
  double bottomMargin,
) {
  BlocProvider.of<ButtonBloc>(context).add(ChangeButton(
    backgroundColor: backgroundColor,
    textColor: textColor,
    bottomMargin: bottomMargin,
  ));
}

void showModal(BuildContext context, Widget page) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return page;
      });
}
