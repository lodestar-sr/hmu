import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';
import 'package:hmu/widgets/buttons/button_text.dart';

import '../../injection_container.dart';
import '../../main.dart';
import '../check_mark_features.dart';

class GoPremiumModal extends StatefulWidget {
  GoPremiumModal({Key key}) : super(key: key);

  @override
  _GoPremiumModalState createState() => _GoPremiumModalState();
}

class _GoPremiumModalState extends State<GoPremiumModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          )),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
      child: SingleChildScrollView(
          child: BlocProvider(
        create: (context) => sl<ButtonBloc>(),
        child: BlocBuilder<ButtonBloc, ButtonState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: calHeightScale(22)),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            loc.main.done,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(
                                    fontSize: calHeightScale(20),
                                    fontWeight: FontWeight.w400),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(loc.main.go_premium,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(
                                        fontSize: calHeightScale(20),
                                        fontWeight: FontWeight.w600)),
                          ),
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: calHeightScale(8),
                  ),
                  child: BlocBuilder<ButtonBloc, ButtonState>(
                    builder: (context, state) {
                      if (state is IndexAndTextChanged)
                        return _buttonIndexBuilder(
                            context, 0, state.index, loc.main.monthly_price, 0,
                            (() {
                          return _indexAndTextChanger(
                              context, loc.main.start_montly_plan, 0);
                        }));
                      else
                        return _buttonIndexBuilder(
                            context, 0, 0, loc.main.monthly_price, 0, (() {
                          return _indexAndTextChanger(
                              context, loc.main.start_montly_plan, 0);
                        }));
                    },
                  ),
                ),
                BlocBuilder<ButtonBloc, ButtonState>(
                  builder: (context, state) {
                    if (state is IndexAndTextChanged)
                      return _buttonIndexBuilder(context, 1, state.index,
                          loc.main.weekly_price, calHeightScale(16), (() {
                        return _indexAndTextChanger(
                            context, loc.main.start_weekly_plan, 1);
                      }));
                    else
                      return _buttonIndexBuilder(context, 1, -1,
                          loc.main.weekly_price, calHeightScale(16), (() {
                        return _indexAndTextChanger(
                            context, loc.main.start_weekly_plan, 1);
                      }));
                  },
                ),
                Text(
                  loc.main.premium_modal_notice,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: calHeightScale(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        loc.main.restore_purchase,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: calHeightScale(13),
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: calWidthScale(30),
                      ),
                      Text(
                        loc.main.terms_and_conditions,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: calHeightScale(13),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: calHeightScale(20)),
                      child: Text(
                        loc.main.with_premium_i_can,
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                CheckMarkFeatures(),
                SizedBox(
                  height: calHeightScale(80),
                ),
                BlocBuilder<ButtonBloc, ButtonState>(
                  builder: (context, state) {
                    if (state is IndexAndTextChanged)
                      return _buttonBuilder(state.text);
                    else
                      return _buttonBuilder(
                        loc.main.start_montly_plan,
                      );
                  },
                )
              ],
            );
          },
        ),
      )),
    );
  }

  Widget _buttonBuilder(String text) {
    return ButtonText(
        title: text, tapped: () {}, bottomMargin: calHeightScale(44));
  }

  void _indexAndTextChanger(BuildContext context, String text, int index) {
    BlocProvider.of<ButtonBloc>(context)
        .add(ChangeIndexAndText(index: index, text: text));
  }

  Widget _buttonIndexBuilder(BuildContext context, int index, int currentIndex,
      String text, double bottomMargin, Function tapped) {
    return ButtonText(
        fontSize: 22,
        width: SizeConfig.widthMultiplier * 100,
        height: calHeightScale(56),
        title: text,
        index: index,
        currentIndex: currentIndex,
        tapped: () => tapped(),
        bottomMargin: calHeightScale(bottomMargin));
  }
}
