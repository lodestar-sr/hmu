import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  Map<String, dynamic> _data;
  String _path;
  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }
  
  Map<String, String> getData(String group) {
    return Map<String, String>.from(_data[group]);
  }

  String getPath() => _path;

  Localemain _main;
  Localemain get main => _main;

  void initAll() {
    _main = Localemain(Map<String, String>.from(_data['main']));
  }
}

class Localemain {
  final Map<String, String> _data;
  Localemain(this._data);

  String getByKey(String key) {
    return _data[key];
  }

  String get try_again => _data["try_again"];
  String get hmu => _data["hmu"];
  String get intro => _data["intro"];
  String get get_started => _data["get_started"];
  String get login => _data["login"];
  String get already_have_an_account => _data["already_have_an_account"];
  String get enter_your_phone_number => _data["enter_your_phone_number"];
  String get phone_number => _data["phone_number"];
  String get continue_ => _data["continue_"];
  String get code_verify_hint => _data["code_verify_hint"];
  String get verify_code_notice => _data["verify_code_notice"];
  String get country_code_not_found => _data["country_code_not_found"];
  String get how_old_are_you => _data["how_old_are_you"];
  String get age_notice => _data["age_notice"];
}

