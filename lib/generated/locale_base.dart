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
  String get over_18s_only => _data["over_18s_only"];
  String get over18_dialog => _data["over18_dialog"];
  String get dont_get_naked => _data["dont_get_naked"];
  String get i_am_over_18 => _data["i_am_over_18"];
  String get i_agree => _data["i_agree"];
  String get house_rules => _data["house_rules"];
  String get house_rules_dialog => _data["house_rules_dialog"];
  String get dont_get_naked_dialog => _data["dont_get_naked_dialog"];
  String get play_nicely => _data["play_nicely"];
  String get play_nicely_dialog => _data["play_nicely_dialog"];
  String get terms_of_use => _data["terms_of_use"];
  String get terms_of_use_dialog => _data["terms_of_use_dialog"];
  String get you_get_50_hmu_in => _data["you_get_50_hmu_in"];
  String get claim_hmu => _data["claim_hmu"];
  String get reveals => _data["reveals"];
  String get upgrade_to_premium => _data["upgrade_to_premium"];
  String get profile => _data["profile"];
  String get account_info => _data["account_info"];
  String get phone => _data["phone"];
  String get show_active_status => _data["show_active_status"];
  String get account_verification => _data["account_verification"];
  String get verify_your_account => _data["verify_your_account"];
  String get general => _data["general"];
  String get push_notifications => _data["push_notifications"];
  String get theme => _data["theme"];
  String get system_default => _data["system_default"];
  String get blocked_users => _data["blocked_users"];
  String get frequently_asked_questions => _data["frequently_asked_questions"];
  String get preferences => _data["preferences"];
  String get notifications_and_sounds => _data["notifications_and_sounds"];
  String get notifications_and_sounds_hint => _data["notifications_and_sounds_hint"];
  String get support => _data["support"];
  String get share_your_feed_back => _data["share_your_feed_back"];
  String get restore_purcahse => _data["restore_purcahse"];
  String get about => _data["about"];
  String get privacy_policy => _data["privacy_policy"];
  String get logout => _data["logout"];
  String get deactive_your_account => _data["deactive_your_account"];
  String get delete_account => _data["delete_account"];
  String get messages => _data["messages"];
  String get search => _data["search"];
  String get you => _data["you"];
}

