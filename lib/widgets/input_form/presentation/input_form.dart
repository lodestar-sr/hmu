import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';

import '../../../injection_container.dart';
import '../../../main.dart';
import 'bloc/input_form_bloc.dart';

class InputForm extends StatefulWidget {
  final String initalText;
  final bool haveAreaCode;
  final String placeHolder;
  final String hint;
  final bool haveReloadIcon;
  final int maxLentgh;
  final bool isSecure;
  final bool readOnly;
  final Function(String) onChanged;
  final Function(bool) onFocused;
  final Function(String) countryCodeOnChanged;
  final Function(String) countryCodeSuggestionSelected;
  final Function() onTap;

  InputForm(
      {Key key,
      @required this.placeHolder,
      @required this.hint,
      @required this.onChanged,
      @required this.maxLentgh,
      @required this.onFocused,
      this.onTap,
      this.initalText,
      this.readOnly = false,
      this.isSecure = false,
      this.haveAreaCode = false,
      this.haveReloadIcon = false,
      this.countryCodeOnChanged,
      this.countryCodeSuggestionSelected})
      : super(key: key);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  TextEditingController controller;
  TextEditingController contryCodesController =
      TextEditingController(text: "44");
  List<String> _countryCodes = [];

  @override
  void initState() {
    controller = TextEditingController(text: widget.initalText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.readOnly) {
      controller = TextEditingController(text: widget.initalText);
    }
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
                onTap: () => (widget.readOnly) ? widget.onTap() : () {},
                controller: controller,
                obscureText: widget.isSecure ?? false,
                obscuringCharacter: '✻',
                showCursor: !widget.readOnly,
                readOnly: widget.readOnly,
                onChanged: (text) => widget.onChanged(text),
                keyboardType: TextInputType.phone,
                textAlign: (widget.isSecure || widget.readOnly)
                    ? TextAlign.center
                    : TextAlign.left,
                maxLength: widget.maxLentgh,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(
                        (widget.haveAreaCode) ? calWidthScale(120) : 0,
                        calHeightScale(10),
                        (widget.haveReloadIcon) ? calWidthScale(10) : 0,
                        0),
                    border: InputBorder.none,
                    hintText: widget.placeHolder,
                    hintStyle: Theme.of(context).textTheme.headline2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppTheme.middleGray),
                    counterText: ""),
              ),
            ),
          ),
          Visibility(
            visible: widget.haveAreaCode,
            child: Positioned(
              bottom: calHeightScale(59) / 5,
              left: calWidthScale(13),
              child: Container(
                constraints: BoxConstraints(maxWidth: calWidthScale(80)),
                height: calHeightScale(37),
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(calHeightScale(30),
                    calHeightScale(5), calWidthScale(5), calHeightScale(5)),
                decoration: BoxDecoration(
                  color: AppTheme.middleGray,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: BlocProvider(
                  create: (context) =>
                      sl<InputFormBloc>()..add(LoadCountriesEvenet()),
                  child: BlocListener<InputFormBloc, InputFormState>(
                    listener: (context, state) {
                      if (state is CountriesCodeLoadedState) {
                        state.countryCodes.forEach((element) {
                          _countryCodes.add(element.dial);
                        });
                        final seen = Set<String>();
                        final unique = _countryCodes
                            .where((str) => seen.add(str))
                            .toList();
                        unique.sort();
                        _countryCodes = unique;
                      }
                    },
                    child: TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: contryCodesController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            border: InputBorder.none, counterText: ""),
                        textAlign: TextAlign.center,
                        maxLength: 5,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.w600),
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                        onChanged: (text) => widget.countryCodeOnChanged(text),
                      ),
                      suggestionsCallback: (pattern) {
                        return _countryCodes
                            .where((element) => element.contains(pattern));
                      },
                      itemBuilder: (context, suggestion) {
                        return Container(
                          height: calHeightScale(30),
                          margin: EdgeInsets.fromLTRB(calHeightScale(5),
                              calHeightScale(5), calHeightScale(5), 0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black))),
                          child: Text(
                            suggestion,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(fontWeight: FontWeight.w300),
                          ),
                        );
                      },
                      onSuggestionSelected: (suggestion) {
                        contryCodesController.text = suggestion.toString();
                        widget.countryCodeSuggestionSelected(
                            suggestion.toString());
                      },
                      noItemsFoundBuilder: (context) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.edgeMargin / 2),
                          child: Text(loc.main.country_code_not_found,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontWeight: FontWeight.w300,
                                  )),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.haveAreaCode,
            child: Positioned(
              bottom: calHeightScale(59) / 4,
              left: calWidthScale(15),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: calHeightScale(5), horizontal: calWidthScale(12)),
                child: Text(
                  "+ ",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.only(top: calHeightScale(24)),
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
        child: Text(
          widget.hint,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    ]);
  }
}
