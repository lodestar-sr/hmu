import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Post extends Equatable {
  final String time;
  final bool haveContactIcon;
  final String username;
  final String userAge;
  Post(
      {@required this.time,
      @required this.username,
      @required this.userAge,
      this.haveContactIcon = false});

  @override
  List<Object> get props => [time, username, userAge, haveContactIcon];
}
