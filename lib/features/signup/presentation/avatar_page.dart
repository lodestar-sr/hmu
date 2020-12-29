import 'package:flutter/material.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/assets_address/images.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/core/utils/presentation_functions.dart';
import 'package:hmu/widgets/avatar.dart';
import 'package:hmu/widgets/buttons/button_icon.dart';
import 'package:hmu/widgets/buttons/button_text.dart';
import 'package:hmu/widgets/modals/go_premium_modal.dart';
import 'package:hmu/widgets/top_navigation.dart';

import '../../../main.dart';

class AvatarPage extends StatefulWidget {
  AvatarPage({Key key}) : super(key: key);

  @override
  _AvatarPageState createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: TopNavigation(
                  title: loc.main.add_your_avatar,
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    PageView(
                      controller: controller,
                      children: [
                        FreePlan(),
                        PremiumPlan(),
                      ],
                    ),
                    Positioned(
                      top: calHeightScale(160),
                      right: calWidthScale(10),
                      child: ButtonIcon(
                        icon: ProjectIcons.chervonRight,
                        tapped: () => controller.nextPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut),
                      ),
                    ),
                    Positioned(
                      top: calHeightScale(160),
                      left: calWidthScale(10),
                      child: ButtonIcon(
                        icon: ProjectIcons.chervonLeft,
                        tapped: () => controller.previousPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class FreePlan extends StatelessWidget {
  const FreePlan({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: calHeightScale(103),
        ),
        Avatar(path: ProjectImages.avatar),
        Container(
          margin: EdgeInsets.fromLTRB(SizeConfig.edgeMargin, calHeightScale(38),
              SizeConfig.edgeMargin, 0),
          child: Text(
            loc.main.avatar_notice,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Spacer(),
        ButtonText(
            title: loc.main.start_chatting,
            tapped: () {},
            bottomMargin: calHeightScale(55))
      ],
    );
  }
}

class PremiumPlan extends StatelessWidget {
  const PremiumPlan({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: calHeightScale(43),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: calHeightScale(20)),
          child: Text(
            loc.main.premium_avatar_locked,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Avatar(path: ProjectImages.premiumAvatar),
        Container(
          margin: EdgeInsets.fromLTRB(SizeConfig.edgeMargin, calHeightScale(38),
              SizeConfig.edgeMargin, 0),
          child: Text(
            loc.main.premium_avtar_notice,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Spacer(),
        ButtonText(
            title: loc.main.go_premium,
            tapped: () {
              showModal(context, GoPremiumModal());
            },
            backgroundColor: Colors.white,
            textColor: Colors.black,
            bottomMargin: calHeightScale(55))
      ],
    );
  }
}
