import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

class InputForm extends StatefulWidget {
  final String initalText;
  final bool haveAreaCode;
  final String placeHolder;
  final String hint;
  final bool haveReloadIcon;
  final int maxLentgh;
  final Function(String) onChanged;
  final Function(bool) onFocused;
  InputForm(
      {Key key,
      @required this.placeHolder,
      @required this.hint,
      @required this.onChanged,
      @required this.maxLentgh,
      @required this.onFocused,
      this.initalText,
      this.haveAreaCode,
      this.haveReloadIcon})
      : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.initalText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
          Container(
            height: calHeightScale(59),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9999),
                color: AppTheme.gray),
            child: Focus(
              onFocusChange: (state) => widget.onFocused(state),
              child: TextField(
                controller: controller,
                onChanged: (text) => widget.onChanged(text),
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,
                maxLength: widget.maxLentgh,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: widget.placeHolder,
                    hintStyle: Theme.of(context).textTheme.headline2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.middleGray),
                    counterStyle: TextStyle(
                      height: double.minPositive,
                    ),
                    counterText: ""),
              ),
            ),
          ),
          Positioned(
            bottom: calHeightScale(59) / 5,
            left: calWidthScale(13),
            child: Container(
              width: calWidthScale(60),
              height: calHeightScale(37),
              padding: EdgeInsets.symmetric(
                  horizontal: calHeightScale(12), vertical: calHeightScale(5)),
              decoration: BoxDecoration(
                color: AppTheme.middleGray,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Text(
                "+44",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.only(top: calHeightScale(24)),
        child: Text(
          widget.hint,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    ]);
  }
}
