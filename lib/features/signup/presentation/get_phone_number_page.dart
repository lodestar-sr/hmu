import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/top_navigation.dart';

class GetPhoneNumberPage extends StatefulWidget {
  final bool isLogin;
  GetPhoneNumberPage({Key key, @required this.isLogin}) : super(key: key);

  @override
  _GetPhoneNumberPageState createState() => _GetPhoneNumberPageState();
}

class _GetPhoneNumberPageState extends State<GetPhoneNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
          child: Column(
            children: [
              TopNavigation(),
            ],
          ),
        ),
      ),
    );
  }
}
