import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hmu/core/Routes/routes.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/generated/locale_base.dart';
import 'package:hmu/widgets/buttons/button_icon.dart';

import '../../../main.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, introPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loc = Localizations.of<LocaleBase>(context, LocaleBase);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: ButtonIcon(
                icon: ProjectIcons.icon,
                iconColor: Colors.white,
                width: calWidthScale(57 * 1.4),
                height: calHeightScale(57 * 1.4),
                clickable: false,
              )),
              Container(
                child: Text(
                  loc.main.hmu,
                  style: TextStyle(
                      fontSize: calHeightScale(48),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: "Eina01"),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
