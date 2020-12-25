import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/core/utils/presentation_functions.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';
import 'package:hmu/widgets/buttons/button_fab.dart';
import 'package:hmu/widgets/input_form.dart/input_form.dart';
import 'package:hmu/widgets/top_navigation.dart';

import '../../../injection_container.dart';
import '../../../main.dart';

class VerifyCodePage extends StatefulWidget {
  final bool isLogin;
  VerifyCodePage({Key key, @required this.isLogin}) : super(key: key);

  @override
  _VerifyCodePageState createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  String code = "";
  bool _isFocused = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ButtonBloc>(),
      child: BlocBuilder<ButtonBloc, ButtonState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: ListView(
                      primary: false,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        TopNavigation(),
                        (_isFocused)
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: calHeightScale(80),
                                    horizontal: calWidthScale(53)),
                                child: Text(
                                  loc.main.verify_code_notice,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      .copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: AppTheme.red),
                                ))
                            : SizedBox(
                                height: calHeightScale(186),
                              ),
                        InputForm(
                          placeHolder: "✻ ✻ ✻ ✻ ✻ ✻",
                          hint: loc.main.code_verify_hint,
                          maxLentgh: 6,
                          isSecure: true,
                          onChanged: (text) {
                            code = text;
                          },
                          onFocused: (isFocused) {
                            _isFocused = isFocused;
                            (isFocused)
                                ? buttonChanger(context, Colors.black,
                                    Colors.white, calHeightScale(123))
                                : buttonChanger(context, Colors.white,
                                    Colors.black, calHeightScale(55));
                          },
                        ),
                      ],
                    ),
                  )),
            ),
            floatingActionButton: ButtonFAB(state: state, nextPage: _nextPage),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }

  void _nextPage() {
    // Navigator.pushNamed(context, verifyCodeRoute, arguments: widget.isLogin);
  }
}
