import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

class InputForm extends StatefulWidget {
  final String initalText;
  final bool haveAreaCode;
  final String placeHolder;
  final String hint;
  final bool haveReloadIcon;
  final Function(String) onChanged;
  final Function() validate;
  InputForm(
      {Key key,
      @required this.placeHolder,
      @required this.hint,
      @required this.onChanged,
      @required this.validate,
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
    return Column(
      children: [
        Container(
          height: calHeightScale(59),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9999), color: AppTheme.gray),
          child: TextField(
            controller: controller,
            onChanged: (text) => widget.onChanged(text),
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.headline2.copyWith(
                  fontWeight: FontWeight.w600, color: AppTheme.middleGray),
            ),
          ),
        )
      ],
    );
  }
}
