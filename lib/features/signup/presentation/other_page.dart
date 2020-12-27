import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/buttons/button_item.dart';
import 'package:hmu/widgets/top_navigation.dart';

import '../../../main.dart';

class OtherPage extends StatefulWidget {
  final String nextRoute;
  OtherPage({Key key, @required this.nextRoute}) : super(key: key);

  @override
  _OtherPageState createState() => _OtherPageState();
}

class _OtherPageState extends State<OtherPage> {
  String gender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
          child: ListView(
            children: [
              TopNavigation(
                title: loc.main.other,
              ),
              SizedBox(
                height: calHeightScale(80),
              ),
              ButtonItem(
                  title: loc.main.transgender,
                  tapped: (value) => gender = value,
                  nextRoute: widget.nextRoute),
              ButtonItem(
                  title: loc.main.transsexual,
                  tapped: (value) => gender = value,
                  nextRoute: widget.nextRoute),
              ButtonItem(
                  title: loc.main.gender_queer,
                  tapped: (value) => gender = value,
                  nextRoute: widget.nextRoute),
              ButtonItem(
                  title: loc.main.gender_fluid,
                  tapped: (value) => gender = value,
                  nextRoute: widget.nextRoute),
              ButtonItem(
                  title: loc.main.gender_variant,
                  tapped: (value) => gender = value,
                  nextRoute: widget.nextRoute),
              ButtonItem(
                  title: loc.main.crossdresser,
                  tapped: (value) => gender = value,
                  nextRoute: widget.nextRoute),
            ],
          ),
        ),
      ),
    );
  }
}
