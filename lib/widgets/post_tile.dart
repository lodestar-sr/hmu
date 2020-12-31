import 'package:flutter/material.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/features/posts/domain/enteties/post.dart';
import 'package:hmu/widgets/buttons/button_icon.dart';

class PostTile extends StatelessWidget {
  final Post post;
  const PostTile({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(calHeightScale(8)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black),
      width: calWidthScale(168),
      height: calHeightScale(247),
      child: Stack(
        children: [
          Positioned(
              width: calWidthScale(150),
              top: calHeightScale(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post.time,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                  Visibility(
                    visible: post.haveContactIcon,
                    child: ButtonIcon(
                      width: calHeightScale(30),
                      height: calHeightScale(30),
                      padding: calHeightScale(5),
                      icon: ProjectIcons.contact,
                      backgroundColor: AppTheme.middleGray,
                    ),
                  ),
                ],
              )),
          Positioned(
              width: calWidthScale(84),
              top: 0,
              bottom: 0,
              left: calWidthScale(35),
              child: ButtonIcon(
                icon: ProjectIcons.icon,
                iconColor: Colors.white,
              )),
          Positioned(
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.username,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: calHeightScale(17),
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    post.userYear,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: calHeightScale(17),
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
