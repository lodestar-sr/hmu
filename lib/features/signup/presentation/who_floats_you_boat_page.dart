import 'package:flutter/material.dart';
import 'package:hmu/core/Routes/routes.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/buttons/button_item.dart';
import 'package:hmu/widgets/top_navigation.dart';

import '../../../main.dart';

class WhoFloatsYourBoatPage extends StatefulWidget {
  WhoFloatsYourBoatPage({Key key}) : super(key: key);

  @override
  _WhoFloatsYourBoatPageState createState() => _WhoFloatsYourBoatPageState();
}

class _WhoFloatsYourBoatPageState extends State<WhoFloatsYourBoatPage> {
  String gender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
          child: ListView(
            children: [
              TopNavigation(title: loc.main.who_floats_your_boat),
              SizedBox(
                height: calHeightScale(130),
              ),
              ButtonItem(
                title: loc.main.girl,
                tapped: (value) => gender = value,
                nextRoute: nicknameRoute,
              ),
              ButtonItem(
                  title: loc.main.guy,
                  tapped: (value) => gender = value,
                  nextRoute: nicknameRoute),
              ButtonItem(
                  title: loc.main.non_binary,
                  tapped: (value) => gender = value,
                  nextRoute: nicknameRoute),
              ButtonItem(
                title: loc.main.other,
                tapped: (value) => gender = value,
                haveNext: true,
                nextRoute: nicknameRoute,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: calHeightScale(23),
                ),
                child: Text(
                  loc.main.notice,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
