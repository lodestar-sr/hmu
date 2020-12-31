import 'package:flutter/material.dart';
import 'package:hmu/core/Routes/routes.dart';
import 'package:hmu/features/bottombar_provider/presentation/bottombar_provider.dart';
import 'package:hmu/features/signup/presentation/age_page.dart';
import 'package:hmu/features/signup/presentation/avatar_page.dart';
import 'package:hmu/features/signup/presentation/gender_page.dart';
import 'package:hmu/features/signup/presentation/get_phone_number_page.dart';
import 'package:hmu/features/signup/presentation/nick_name_page.dart';
import 'package:hmu/features/signup/presentation/other_page.dart';
import 'package:hmu/features/signup/presentation/verify_code_page.dart';
import 'package:hmu/features/signup/presentation/who_floats_you_boat_page.dart';
import 'package:hmu/features/splash/presentation/gate_page.dart';
import 'package:hmu/features/splash/presentation/splash_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case gateRoute:
        return MaterialPageRoute(builder: (_) => GatePage());
      case getPhoneNumberRoute:
        final bool arg = settings.arguments as bool;
        return MaterialPageRoute(
            builder: (_) => GetPhoneNumberPage(
                  isLogin: arg,
                ));
      case verifyCodeRoute:
        final bool arg = settings.arguments as bool;
        return MaterialPageRoute(
            builder: (_) => VerifyCodePage(
                  isLogin: arg,
                ));
      case ageRoute:
        return MaterialPageRoute(builder: (_) => AgePage());
      case genderRoute:
        return MaterialPageRoute(builder: (_) => GenderPage());
      case otherRote:
        final String arg = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => OtherPage(nextRoute: arg));
      case whoFloatsYourBoatRoute:
        return MaterialPageRoute(builder: (_) => WhoFloatsYourBoatPage());
      case nicknameRoute:
        return MaterialPageRoute(builder: (_) => NicknamePage());
      case avatarRoute:
        return MaterialPageRoute(builder: (_) => AvatarPage());
      case bottombarPoviderRoute:
        return MaterialPageRoute(builder: (_) => BottomBarProvider());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
