import 'package:flutter/material.dart';
import 'package:hmu/core/Routes/routes.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/buttons/button_text.dart';
import 'package:hmu/widgets/logo.dart';

import '../../../main.dart';

class GatePage extends StatefulWidget {
  GatePage({Key key}) : super(key: key);

  @override
  _GatePageState createState() => _GatePageState();
}

class _GatePageState extends State<GatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        SizedBox(
          height: calHeightScale(189),
        ),
        Logo(color: Colors.black),
        SizedBox(
          height: calHeightScale(23),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: calWidthScale(43)),
          child: Text(
            loc.main.intro,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Spacer(),
        ButtonText(
          title: loc.main.get_started,
          bottomMargin: 0,
          tapped: () {
            Navigator.pushNamed(context, getPhoneNumberRoute, arguments: false);
          },
          backgroundColor: Colors.white,
          textColor: Colors.black,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, getPhoneNumberRoute, arguments: true);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: calHeightScale(43)),
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: loc.main.already_have_an_account + " ",
                  style: Theme.of(context).textTheme.headline4),
              TextSpan(
                  text: loc.main.login,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.bold))
            ])),
          ),
        )
      ],
    )));
  }
}
