import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/Routes/routes.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/core/utils/presentation_functions.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';
import 'package:hmu/widgets/buttons/button_fab.dart';
import 'package:hmu/widgets/input_form/presentation/input_form.dart';
import 'package:hmu/widgets/top_navigation.dart';

import '../../../injection_container.dart';
import '../../../main.dart';

class NicknamePage extends StatefulWidget {
  NicknamePage({Key key}) : super(key: key);

  @override
  _NicknamePageState createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  String nickname = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<ButtonBloc>(),
        child: BlocBuilder<ButtonBloc, ButtonState>(builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: ListView(
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      TopNavigation(
                        title: loc.main.nickname,
                      ),
                      SizedBox(
                        height: calHeightScale(136),
                      ),
                      Stack(
                        children: [
                          InputForm(
                            placeHolder: "",
                            hint: loc.main.nickname_hint,
                            onChanged: (text) {
                              nickname = text;
                            },
                            maxLentgh: 7,
                            onFocused: (isFocused) {
                              (isFocused)
                                  ? buttonChanger(context, Colors.black,
                                      Colors.white, calHeightScale(123))
                                  : buttonChanger(context, Colors.white,
                                      Colors.black, calHeightScale(55));
                            },
                            haveReloadIcon: true,
                          ),
                          Positioned(
                              top: calHeightScale(57) / 3,
                              left: calWidthScale(13),
                              child: Text(
                                loc.main.revealchatcom,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(
                                        fontSize: calHeightScale(17),
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.middleGray),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: ButtonFAB(state: state, nextPage: _nextPage),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        }));
  }

  void _nextPage() {
    Navigator.pushNamed(
      context,
      avatarRoute,
    );
  }
}
