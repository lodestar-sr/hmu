import 'package:flutter/material.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/assets_address/images.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/features/chat/domain/enteties/chat_preview.dart';
import 'package:hmu/widgets/buttons/button_chat_preview.dart';
import 'package:hmu/widgets/buttons/button_icon.dart';

import '../../../main.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController controller = TextEditingController();
  List<ChatPreview> chatPreviews = [];
  @override
  void initState() {
    final chat1 = ChatPreview(
        avtarPath: ProjectImages.messageAvatar,
        username: "Stormy_Fog",
        lastMessage: "What's man!",
        userStatus: "offline",
        time: "9:40 AM");
    chatPreviews = [chat1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(top: calHeightScale(50)),
                  margin: EdgeInsets.only(
                    bottom: calHeightScale(22),
                  ),
                  child: Text(
                    loc.main.messages,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: calHeightScale(10)),
                  height: calHeightScale(40),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9999),
                      color: AppTheme.gray),
                  child: Stack(
                    children: [
                      Focus(
                        child: TextField(
                          controller: controller,
                          style: Theme.of(context).textTheme.headline2.copyWith(
                              fontSize: calHeightScale(17),
                              fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(
                                calHeightScale(44), 10, 0, 10),
                            border: InputBorder.none,
                            hintText: loc.main.search,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(
                                    fontSize: calHeightScale(17),
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.middleGray),
                          ),
                        ),
                      ),
                      Positioned(
                          child: ButtonIcon(
                        icon: ProjectIcons.search,
                        iconColor: AppTheme.middleGray,
                        backgroundColor: Colors.transparent,
                      ))
                    ],
                  ),
                ),
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: chatPreviews.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ButtonChatPreview(chatPreview: chatPreviews[index]);
                  },
                ),
              ],
            ),
          )),
    ));
  }
}
