import 'package:flutter/material.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/features/chat/domain/enteties/chat_preview.dart';
import 'package:hmu/widgets/avatar.dart';

import '../../main.dart';

class ButtonChatPreview extends StatelessWidget {
  final ChatPreview chatPreview;
  const ButtonChatPreview({Key key, @required this.chatPreview})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: calWidthScale(10)),
              child: Avatar(
                  width: calHeightScale(60),
                  height: calHeightScale(60),
                  path: chatPreview.avtarPath),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        chatPreview.username,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                            fontSize: calHeightScale(17),
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                          width: calHeightScale(16),
                          height: calHeightScale(16),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.middleGray)))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        loc.main.you + " : " + chatPreview.lastMessage,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppTheme.middleGray),
                      ),
                      Text(
                        chatPreview.time,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppTheme.middleGray),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
