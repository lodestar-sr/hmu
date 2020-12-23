import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  static double verticalMargin;
  static double horizontalMargin;
  static double edgeMargin;
  static double mostafaScaleNumber = 1;
  static final double iphoneXHeight = 8.12;
  static final double iphoneXwidth = 3.75;
  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    /*This design is based on the iPhone X (what figma designed).
     Width and height of items in formula 
     (width or height of figma item) / (height: 8.12 or width: 3.75) * (the width or height of the physical device)*/

    verticalMargin = calHeightScale(10); //10
    horizontalMargin = calWidthScale(10); //10
    edgeMargin = calWidthScale(16); //16
    // print(_blockWidth);
    //print(_blockHeight);
  }
}

double calWidthScale(double size) =>
    (size / SizeConfig.iphoneXwidth) * SizeConfig.widthMultiplier;
double calHeightScale(double size) =>
    (size / SizeConfig.iphoneXHeight) * SizeConfig.heightMultiplier;
