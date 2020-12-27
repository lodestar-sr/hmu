import 'package:flutter/material.dart';
import 'package:hmu/core/Routes/routes.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/buttons/button_item.dart';
import 'package:hmu/widgets/top_navigation.dart';

import '../../../main.dart';

class GenderPage extends StatefulWidget {
  GenderPage({Key key}) : super(key: key);

  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String gender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
          child: ListView(
            children: [
              TopNavigation(title: loc.main.select_your_gender),
              SizedBox(
                height: calHeightScale(130),
              ),
              ButtonItem(
                title: loc.main.girl,
                tapped: (value) => gender = value,
                nextRoute: whoFloatsYourBoatRoute,
              ),
              ButtonItem(
                  title: loc.main.guy,
                  tapped: (value) => gender = value,
                  nextRoute: whoFloatsYourBoatRoute),
              ButtonItem(
                  title: loc.main.non_binary,
                  tapped: (value) => gender = value,
                  nextRoute: whoFloatsYourBoatRoute),
              ButtonItem(
                title: loc.main.other,
                tapped: (value) => gender = value,
                haveNext: true,
                nextRoute: whoFloatsYourBoatRoute,
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
