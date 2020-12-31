import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/theme_and_app_size/app_theme.dart';
import 'package:hmu/core/theme_and_app_size/sizes_config.dart';
import 'package:hmu/features/posts/domain/enteties/post.dart';
import 'package:hmu/widgets/buttons/bloc/button_bloc.dart';
import 'package:hmu/widgets/buttons/button_tag.dart';
import 'package:hmu/widgets/buttons/button_text.dart';
import 'package:hmu/widgets/post_tile.dart';

import '../../../injection_container.dart';
import '../../../main.dart';

class TimeLinePage extends StatefulWidget {
  TimeLinePage({Key key}) : super(key: key);

  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  List<bool> tagsSelected = [true, false, false, false, false];
  List<Post> posts = [];
  @override
  void initState() {
    Post post1 = Post(
        time: "Just now",
        username: "Stormy_Fog",
        userYear: "18y",
        haveContactIcon: true);
    Post post2 = Post(
      time: "Just now",
      username: "tin_post",
      userYear: "24y",
    );
    Post post3 = Post(time: "Just now", username: "car_walk", userYear: "19y");
    Post post4 = Post(time: "Just now", username: "mix_pasta", userYear: "27y");
    posts = [post1, post2, post3, post4];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocProvider(
          create: (context) => sl<ButtonBloc>(),
          child: BlocListener<ButtonBloc, ButtonState>(
            listener: (context, state) {
              if (state is ToggleButtonIndexChanged) {
                tagsSelected[state.index] = !tagsSelected[state.index];
              }
            },
            child: Container(
              child: ListView(
                children: [
                  SizedBox(
                    height: calHeightScale(50),
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: SizeConfig.edgeMargin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          loc.main.hmu,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        ButtonText(
                          title: "10",
                          tapped: () {},
                          textColor: Colors.black,
                          haveBorder: false,
                          width: calWidthScale(70),
                          bottomMargin: 0,
                          icon: ProjectIcons.icon,
                          backgroundColor: AppTheme.gray,
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<ButtonBloc, ButtonState>(
                    builder: (context, state) {
                      return Container(
                        height: calHeightScale(50),
                        margin:
                            EdgeInsets.symmetric(vertical: calHeightScale(15)),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ToggleButtons(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              fillColor: Colors.transparent,
                              renderBorder: false,
                              children: [
                                ButtonTag(
                                  text: loc.main.all,
                                  isActive: tagsSelected[0],
                                ),
                                ButtonTag(
                                  text: loc.main.male,
                                  isActive: tagsSelected[1],
                                ),
                                ButtonTag(
                                  text: loc.main.female,
                                  isActive: tagsSelected[2],
                                ),
                                ButtonTag(
                                  text: loc.main.worldwide,
                                  isActive: tagsSelected[3],
                                ),
                                ButtonTag(
                                  text: loc.main.eighteen_ninety_nine,
                                  isActive: tagsSelected[4],
                                )
                              ],
                              isSelected: tagsSelected,
                              onPressed: (index) {
                                BlocProvider.of<ButtonBloc>(context).add(
                                    ChangeToggleButtonIndex(
                                        index: index,
                                        value: !tagsSelected[index]));
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.edgeMargin),
                      child: GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: posts.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 168 / 247,
                                  crossAxisSpacing: calWidthScale(7),
                                  mainAxisSpacing: calHeightScale(7)),
                          itemBuilder: (BuildContext context, int index) {
                            return PostTile(post: posts[index]);
                          })),
                  SizedBox(
                    height: calHeightScale(80),
                  )
                ],
              ),
            ),
          )),
      floatingActionButton: Container(
        color: Colors.white,
        height: calHeightScale(70),
        child: Center(
          child: ButtonText(
            title: loc.main.post_a_hmu,
            tapped: () {},
            bottomMargin: 0,
            icon: ProjectIcons.icon,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }
}
