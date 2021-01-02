import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ChatPreview extends Equatable {
  final String avtarPath;
  final String username;
  final String lastMessage;
  final String userStatus;
  final String time;
  ChatPreview(
      {@required this.avtarPath,
      @required this.username,
      @required this.lastMessage,
      @required this.userStatus,
      @required this.time});
  @override
  List<Object> get props => [username];
}
