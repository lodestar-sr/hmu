import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/Routes/routes.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/core/utils/presentation_functions.dart';
import 'package:hmu/widgets/buttons/button_icon.dart';

import '../../injection_container.dart';
import 'bloc/button_bloc.dart';

class ButtonItem extends StatelessWidget {
  final bool haveNext;
  final String nextRoute;
  final String title;
  final Function(String) tapped;
  const ButtonItem(
      {Key key,
      @required this.title,
      @required this.tapped,
      this.haveNext = false,
      @required this.nextRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ButtonBloc>(),
      child: BlocBuilder<ButtonBloc, ButtonState>(
        builder: (context, state) {
          return GestureDetector(
              onTapDown: (details) {
                buttonChanger(context, Colors.black, Colors.white, 0);
                tapped(title);
                (haveNext)
                    ? Navigator.pushNamed(context, otherRote,
                        arguments: nextRoute)
                    : Navigator.pushNamed(context, nextRoute);
                Timer(
                  Duration(milliseconds: 100),
                  () => buttonChanger(context, Colors.white, Colors.black, 0),
                );
              },
              onTapUp: (details) =>
                  buttonChanger(context, Colors.white, Colors.black, 0),
              child: (state is ButtonChanged)
                  ? _buttonBuilder(
                      context, state.backgroundColor, state.textColor)
                  : _buttonBuilder(context, Colors.white, Colors.black));
        },
      ),
    );
  }

  Widget _buttonBuilder(
      BuildContext context, Color backgroundColor, Color textColor) {
    return Container(
      height: calHeightScale(82),
      margin: EdgeInsets.only(bottom: calHeightScale(9)),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
      ),
      child: Row(children: [
        Expanded(
            child: Container(
          margin: EdgeInsets.only(left: (haveNext) ? calWidthScale(50) : 0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline2
                .copyWith(fontWeight: FontWeight.w600, color: textColor),
          ),
        )),
        Visibility(
          visible: haveNext,
          child: ButtonIcon(
            icon: ProjectIcons.chervonRight,
            iconColor: textColor,
          ),
        )
      ]),
    );
  }
}
