import 'package:flutter/material.dart';

import '../main.dart';
import 'check_mark_text.dart';

class CheckMarkFeatures extends StatelessWidget {
  const CheckMarkFeatures({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckMarkText(text: loc.main.get_unlimited_hmus),
        CheckMarkText(text: loc.main.see_users_just_from_your_country),
        CheckMarkText(text: loc.main.premium_avatars),
        CheckMarkText(text: loc.main.choose_message_colour),
        CheckMarkText(text: loc.main.advert_free_experience),
        CheckMarkText(text: loc.main.priority_support_from_the_reveal_team),
      ],
    );
  }
}
