import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/core/utils/presentation_functions.dart';
import 'package:hmu/features/posts/presentation/time_line_page.dart';
import 'package:hmu/widgets/buttons/button_bottombar_item.dart';
import 'package:hmu/widgets/modals/dialog_to_user.dart';

import '../../../injection_container.dart';
import '../../../main.dart';
import 'bloc/bottombar_provider_bloc.dart';

class BottomBarProvider extends StatefulWidget {
  BottomBarProvider({Key key}) : super(key: key);

  @override
  _BottomBarProviderState createState() => _BottomBarProviderState();
}

class _BottomBarProviderState extends State<BottomBarProvider> {
  List<Widget> _children = [
    Center(
      child: Text("1"),
    ),
    TimeLinePage(),
    Center(
      child: Text("3"),
    )
  ];
  @override
  void initState() {
    _showDialogs(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BottombarProviderBloc>(),
      child: BlocBuilder<BottombarProviderBloc, BottombarProviderState>(
        builder: (context, state) {
          if (state is BottombarIndexChanged)
            return _scaffoldBuilder(context, state.index);
          else
            return _scaffoldBuilder(context, 1);
        },
      ),
    );
  }

  Widget _scaffoldBuilder(BuildContext context, int index) {
    return Scaffold(
      body: _children[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: ButtonBottomBarItem(
              path: ProjectIcons.messageDeactive,
            ),
            activeIcon: ButtonBottomBarItem(
              path: ProjectIcons.messageActive,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: ButtonBottomBarItem(
              path: ProjectIcons.hmuDeactive,
              isMain: true,
            ),
            activeIcon: ButtonBottomBarItem(
              path: ProjectIcons.hmuActive,
              isMain: true,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: ButtonBottomBarItem(
              path: ProjectIcons.avatarDeactive,
            ),
            activeIcon: ButtonBottomBarItem(
              path: ProjectIcons.avatarActive,
            ),
          ),
        ],
        onTap: (index) {
          BlocProvider.of<BottombarProviderBloc>(context)
              .add(ChangeBottomBarIndex(index: index));
        },
      ),
    );
  }

  void _showDialogs(BuildContext context) {
    Timer(Duration(milliseconds: 1), () {
      showDialogToUser(
          context,
          DialogToUser(
              header: loc.main.house_rules,
              body: loc.main.house_rules_dialog,
              action: loc.main.continue_,
              tapped: () {
                showDialogToUser(
                    context,
                    DialogToUser(
                        header: loc.main.over_18s_only,
                        body: loc.main.over18_dialog,
                        action: loc.main.i_am_over_18,
                        tapped: () {
                          showDialogToUser(
                              context,
                              DialogToUser(
                                header: loc.main.dont_get_naked,
                                body: loc.main.dont_get_naked_dialog,
                                action: loc.main.i_agree,
                                tapped: () {
                                  showDialogToUser(
                                      context,
                                      DialogToUser(
                                          header: loc.main.play_nicely,
                                          body: loc.main.play_nicely_dialog,
                                          action: loc.main.i_agree,
                                          tapped: () {
                                            showDialogToUser(
                                                context,
                                                DialogToUser(
                                                  header: loc.main.terms_of_use,
                                                  body: loc
                                                      .main.terms_of_use_dialog,
                                                  action: loc.main.i_agree,
                                                  tapped: () {},
                                                ));
                                          }));
                                },
                              ));
                        }));
              }));
    });
  }
}
