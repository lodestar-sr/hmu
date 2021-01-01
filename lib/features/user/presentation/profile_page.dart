import 'package:flutter/material.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/assets_address/images.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/widgets/avatar.dart';
import 'package:hmu/widgets/buttons/button_icon.dart';
import 'package:hmu/widgets/buttons/button_settings.dart';
import 'package:hmu/widgets/setting_category.dart';
import 'package:share/share.dart';

import '../../../main.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: calHeightScale(50)),
            margin: EdgeInsets.fromLTRB(
              SizeConfig.edgeMargin,
              0,
              SizeConfig.edgeMargin,
              calHeightScale(22),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  loc.main.profile,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                ButtonIcon(
                  icon: ProjectIcons.share,
                  width: calHeightScale(35),
                  height: calHeightScale(35),
                  padding: 5,
                  backgroundColor: AppTheme.gray,
                  tapped: () {
                    Share.share("Hi Viladimir");
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: calHeightScale(9)),
            width: calHeightScale(126),
            height: calHeightScale(126),
            child: Avatar(
              path: ProjectImages.avatar,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Matt",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: calHeightScale(70)),
            child: SettingCategory(title: loc.main.account_info, children: [
              ButtonSettings(
                avatarColor: Colors.black,
                title: loc.main.nickname,
                tapped: (value) {},
                haveBorder: true,
                preview: "@matt",
              ),
              ButtonSettings(
                avatarColor: AppTheme.middleGray,
                title: loc.main.phone,
                tapped: (value) {},
                haveBorder: true,
                preview: "+44 07866 410 578",
              ),
              ButtonSettings(
                avatarColor: AppTheme.middleGray,
                title: loc.main.show_active_status,
                tapped: (value) {},
                haveBorder: false,
                switchValue: false,
                haveSwitch: true,
              )
            ]),
          ),
          SectionSpacer(),
          Container(
            padding: EdgeInsets.only(bottom: calHeightScale(10)),
            child: SettingCategory(
                title: loc.main.account_verification,
                children: [
                  ButtonSettings(
                      avatarColor: Colors.black,
                      title: loc.main.verify_your_account,
                      tapped: (value) {},
                      haveBorder: true)
                ]),
          ),
          SectionSpacer(),
          SettingCategory(title: loc.main.general, children: [
            ButtonSettings(
              avatarColor: Colors.black,
              title: loc.main.push_notifications,
              tapped: (value) {},
              haveBorder: true,
              switchValue: false,
              haveSwitch: true,
            ),
            ButtonSettings(
              avatarColor: AppTheme.gray,
              title: loc.main.theme,
              tapped: (value) {},
              haveBorder: true,
              preview: loc.main.system_default,
            ),
            ButtonSettings(
                avatarColor: AppTheme.middleGray,
                title: loc.main.blocked_users,
                tapped: (value) {},
                haveBorder: true),
            ButtonSettings(
                avatarColor: AppTheme.middleGray,
                title: loc.main.frequently_asked_questions,
                tapped: (value) {},
                haveBorder: false),
          ]),
          SectionSpacer(),
          Container(
            padding: EdgeInsets.only(bottom: calHeightScale(10)),
            child: SettingCategory(title: loc.main.preferences, children: [
              ButtonSettings(
                  avatarColor: Colors.black,
                  title: loc.main.notifications_and_sounds,
                  tapped: (value) {},
                  hint: loc.main.notifications_and_sounds_hint,
                  switchValue: false,
                  haveSwitch: true,
                  haveBorder: true)
            ]),
          ),
          SectionSpacer(),
          Container(
            padding: EdgeInsets.only(bottom: calHeightScale(10)),
            child: SettingCategory(title: loc.main.support, children: [
              ButtonSettings(
                  avatarColor: Colors.black,
                  title: loc.main.share_your_feed_back,
                  tapped: (value) {},
                  haveBorder: true),
              ButtonSettings(
                  avatarColor: AppTheme.gray,
                  title: loc.main.restore_purchase,
                  tapped: (value) {},
                  haveBorder: true)
            ]),
          ),
          SectionSpacer(),
          SettingCategory(title: loc.main.about, children: [
            ButtonSettings(
                avatarColor: Colors.black,
                title: loc.main.terms_of_use,
                tapped: (value) {},
                haveBorder: true),
            ButtonSettings(
                avatarColor: AppTheme.middleGray,
                title: loc.main.privacy_policy,
                tapped: (value) {},
                haveBorder: true),
            ButtonSettings(
                avatarColor: Colors.black,
                title: loc.main.logout,
                tapped: (value) {},
                topMargin: calHeightScale(60),
                haveBorder: true),
            ButtonSettings(
                avatarColor: AppTheme.middleGray,
                title: loc.main.deactive_your_account,
                tapped: (value) {},
                haveBorder: false),
            ButtonSettings(
                avatarColor: AppTheme.middleGray,
                title: loc.main.delete_account,
                tapped: (value) {},
                haveBorder: false)
          ])
        ],
      ),
    ));
  }
}

class SectionSpacer extends StatelessWidget {
  const SectionSpacer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: calHeightScale(7),
      color: AppTheme.gray,
    );
  }
}
