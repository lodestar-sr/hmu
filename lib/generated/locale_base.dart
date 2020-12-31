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
  String get notice => _data["notice"];
  String get select_your_gender => _data["select_your_gender"];
  String get girl => _data["girl"];
  String get guy => _data["guy"];
  String get non_binary => _data["non_binary"];
  String get other => _data["other"];
  String get transgender => _data["transgender"];
  String get transsexual => _data["transsexual"];
  String get gender_queer => _data["gender_queer"];
  String get gender_fluid => _data["gender_fluid"];
  String get gender_variant => _data["gender_variant"];
  String get crossdresser => _data["crossdresser"];
  String get who_floats_your_boat => _data["who_floats_your_boat"];
  String get nickname_hint => _data["nickname_hint"];
  String get nickname => _data["nickname"];
  String get revealchatcom => _data["revealchatcom"];
  String get add_your_avatar => _data["add_your_avatar"];
  String get avatar_notice => _data["avatar_notice"];
  String get start_chatting => _data["start_chatting"];
  String get premium_avatar_locked => _data["premium_avatar_locked"];
  String get premium_avtar_notice => _data["premium_avtar_notice"];
  String get go_premium => _data["go_premium"];
  String get done => _data["done"];
  String get monthly_price => _data["monthly_price"];
  String get weekly_price => _data["weekly_price"];
  String get premium_modal_notice => _data["premium_modal_notice"];
  String get restore_purchase => _data["restore_purchase"];
  String get terms_and_conditions => _data["terms_and_conditions"];
  String get with_premium_i_can => _data["with_premium_i_can"];
  String get get_unlimited_hmus => _data["get_unlimited_hmus"];
  String get see_users_just_from_your_country => _data["see_users_just_from_your_country"];
  String get premium_avatars => _data["premium_avatars"];
  String get choose_message_colour => _data["choose_message_colour"];
  String get advert_free_experience => _data["advert_free_experience"];
  String get priority_support_from_the_reveal_team => _data["priority_support_from_the_reveal_team"];
  String get start_montly_plan => _data["start_montly_plan"];
  String get start_weekly_plan => _data["start_weekly_plan"];
  String get all => _data["all"];
  String get male => _data["male"];
  String get female => _data["female"];
  String get worldwide => _data["worldwide"];
  String get eighteen_ninety_nine => _data["eighteen_ninety_nine"];
  String get post_a_hmu => _data["post_a_hmu"];
}

