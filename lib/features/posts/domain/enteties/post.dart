import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Post extends Equatable {
  final String time;
  final bool haveContactIcon;
  final String username;
  final String userYear;
  Post(
      {@required this.time,
      @required this.username,
      @required this.userYear,
      this.haveContactIcon = false});

  @override
  List<Object> get props => [time, username, userYear, haveContactIcon];
}
