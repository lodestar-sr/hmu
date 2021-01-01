import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';
import 'package:hmu/widgets/buttons/button_icon.dart';

import '../../injection_container.dart';

class ButtonSettings extends StatelessWidget {
  final Color avatarColor;
  final String title;
  final String preview;
  final Function(bool) tapped;
  final bool haveSwitch;
  final String hint;
  final bool haveBorder;
  final bool switchValue;
  final double topMargin;
  const ButtonSettings(
      {Key key,
      @required this.avatarColor,
      @required this.title,
      @required this.tapped,
      @required this.haveBorder,
      this.preview = "",
      this.switchValue = false,
      this.haveSwitch = false,
      this.hint = "",
      this.topMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => tapped(true),
      child: Container(
        margin: EdgeInsets.only(top: topMargin ?? 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: avatarColor,
              maxRadius: calHeightScale(20),
            ),
            Container(
              width: calWidthScale(300),
              padding: EdgeInsets.symmetric(vertical: calHeightScale(10)),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: (haveBorder)
                              ? AppTheme.middleGray
                              : Colors.transparent))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                      Spacer(),
                      Visibility(
                        visible: preview.isNotEmpty,
                        child: Text(
                          preview,
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppTheme.middleGray),
                        ),
                      ),
                      (haveSwitch)
                          ? BlocProvider(
                              create: (context) => sl<ButtonBloc>(),
                              child: BlocBuilder<ButtonBloc, ButtonState>(
                                builder: (context, state) {
                                  if (state is SwitcherChanged)
                                    return _switchBuilder(context, state.value);
                                  else
                                    return _switchBuilder(context, switchValue);
                                },
                              ),
                            )
                          : ButtonIcon(
                              icon: ProjectIcons.chervonRight,
                              clickable: false,
                              iconColor: AppTheme.middleGray,
                              backgroundColor: Colors.transparent,
                            )
                    ],
                  ),
                  Visibility(
                    visible: hint.isNotEmpty,
                    child: Container(
                      margin: EdgeInsets.only(right: calHeightScale(80)),
                      child: Text(
                        hint,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: calHeightScale(13),
                            fontWeight: FontWeight.w400,
                            color: AppTheme.middleGray),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _switchBuilder(BuildContext context, bool value) {
    return Container(
      margin: EdgeInsets.only(right: SizeConfig.edgeMargin / 2),
      child: CupertinoSwitch(
        value: value,
        onChanged: (_value) {
          BlocProvider.of<ButtonBloc>(context)
              .add(ChangeSwitcher(value: _value));
        },
      ),
    );
  }
}
