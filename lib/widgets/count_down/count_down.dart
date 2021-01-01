import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/main.dart';
import 'package:hmu/widgets/buttons/button_text.dart';
import '../../injection_container.dart';
import 'bloc/count_down_bloc.dart';

class CountDown extends StatefulWidget {
  final Function() countDownStarted;
  CountDown({Key key, @required this.countDownStarted}) : super(key: key);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  bool activeHmuButton = true;
  int seconds = 86400;
  Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black)),
      margin: EdgeInsets.symmetric(
          vertical: calHeightScale(35), horizontal: calWidthScale(22)),
      padding: EdgeInsets.symmetric(
          vertical: calHeightScale(23), horizontal: calWidthScale(34)),
      child: BlocProvider(
          create: (context) => sl<CountDownBloc>(),
          child: BlocListener<CountDownBloc, CountDownState>(
            listener: (context, state) {
              if (state is CountDownStarted) {
                startCountDown(context);
                activeHmuButton = false;
              }
            },
            child: BlocBuilder<CountDownBloc, CountDownState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      loc.main.you_get_50_hmu_in,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0, calHeightScale(5), 0, calHeightScale(10)),
                      child: BlocBuilder<CountDownBloc, CountDownState>(
                          builder: (context, state) {
                        if (state is CountDownChanged)
                          return _timeBuilder(context, state.seconds);
                        else
                          return _timeBuilder(context, 0);
                      }),
                    ),
                    ButtonText(
                      title: loc.main.claim_hmu,
                      clickable: activeHmuButton,
                      tapped: () {
                        BlocProvider.of<CountDownBloc>(context)
                            .add(StartCountDown());
                        widget.countDownStarted();
                      },
                      bottomMargin: 0,
                      icon: ProjectIcons.icon,
                    )
                  ],
                );
              },
            ),
          )),
    );
  }

  Widget _timeBuilder(BuildContext context, int seconds) {
    final hours = (seconds ~/ 3600).toString();
    final minutes = ((seconds % 3600) ~/ 60).toString();
    final second = ((seconds % 3600) % 60).toInt().toString();
    return Text(hours + " h : " + minutes + " min : " + second + " sec",
        style: Theme.of(context)
            .textTheme
            .headline2
            .copyWith(fontWeight: FontWeight.w500));
  }

  void startCountDown(BuildContext context) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds == 0)
        timer.cancel();
      else
        BlocProvider.of<CountDownBloc>(context)
            .add(ChangeCountDown(seconds: --seconds));
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
