import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/top_navigation.dart';

class NicknamePage extends StatefulWidget {
  NicknamePage({Key key}) : super(key: key);

  @override
  _NicknamePageState createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
          child: ListView(
            children: [
              TopNavigation(
                title: "Your Nickname",
              )
            ],
          ),
        ),
      ),
    );
  }
}
