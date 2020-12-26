import 'package:flutter/material.dart';
import 'package:hmu/widgets/top_navigation.dart';

class AgePage extends StatefulWidget {
  AgePage({Key key}) : super(key: key);

  @override
  _AgePageState createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TopNavigation(),
          ],
        ),
      ),
    );
  }
}
