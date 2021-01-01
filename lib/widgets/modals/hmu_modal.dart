import 'package:flutter/material.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/core/utils/presentation_functions.dart';
import 'package:hmu/widgets/buttons/button_text.dart';
import 'package:hmu/widgets/count_down/count_down.dart';
import 'package:hmu/widgets/modals/go_premium_modal.dart';

import '../../main.dart';
import '../check_mark_features.dart';

class HmuModal extends StatefulWidget {
  HmuModal({Key key}) : super(key: key);

  @override
  _HmuModalState createState() => _HmuModalState();
}

class _HmuModalState extends State<HmuModal> {
  String hmuScore = "10";
  String title = loc.main.hmu;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          )),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: calHeightScale(22)),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      loc.main.done,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          fontSize: calHeightScale(20),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(title,
                          style: Theme.of(context).textTheme.headline3.copyWith(
                              fontSize: calHeightScale(20),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  ButtonText(
                    title: hmuScore,
                    tapped: () {},
                    textColor: Colors.black,
                    haveBorder: false,
                    width: calWidthScale(70),
                    height: calHeightScale(28),
                    bottomMargin: 0,
                    iconPadding: calHeightScale(5),
                    icon: ProjectIcons.icon,
                    backgroundColor: AppTheme.gray,
                  ),
                  SizedBox(
                    width: calWidthScale(11),
                  ),
                  ButtonText(
                      title: "?",
                      backgroundColor: AppTheme.middleGray,
                      haveBorder: false,
                      textColor: Colors.white,
                      width: calHeightScale(28),
                      height: calHeightScale(28),
                      tapped: () {},
                      bottomMargin: 0),
                ],
              )),
          CountDown(
            countDownStarted: () {
              setState(() {
                title = loc.main.reveals;
                hmuScore = "60";
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: calHeightScale(10)),
            child: Text(
              loc.main.get_unlimited_hmus,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            loc.main.upgrade_to_premium,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Container(
            child: CheckMarkFeatures(),
          ),
          SizedBox(
            height: calHeightScale(60),
          ),
          ButtonText(
              title: loc.main.go_premium,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              tapped: () {
                Navigator.pop(context);
                showModal(context, GoPremiumModal());
              },
              bottomMargin: calHeightScale(44))
        ],
      )),
    );
  }
}
