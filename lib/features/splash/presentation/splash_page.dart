import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hmu/core/Routes/routes.dart';
import 'package:hmu/generated/locale_base.dart';
import 'package:hmu/widgets/logo.dart';

import '../../../main.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, gateRoute);
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
        children: [Logo(color: Colors.white)],
      )),
    );
  }
}
