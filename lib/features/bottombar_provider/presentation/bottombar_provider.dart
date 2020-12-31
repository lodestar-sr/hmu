import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hmu/core/assets_address/icons.dart';
import 'package:hmu/features/posts/presentation/time_line_page.dart';
import 'package:hmu/widgets/buttons/button_bottombar_item.dart';

import '../../../injection_container.dart';
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
}
