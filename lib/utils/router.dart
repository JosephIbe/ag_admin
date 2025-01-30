import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:agoris_admin/common/route_constants.dart';

import 'package:agoris_admin/presentation/journeys/auth/forgot_password.dart';
import 'package:agoris_admin/presentation/journeys/auth/reset_password.dart';
import 'package:agoris_admin/presentation/journeys/auth/login.dart';

import 'package:agoris_admin/presentation/journeys/home/dashboard.dart';

class AppRouter {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteLiterals.loginRoute:
        return CupertinoPageRoute(builder: (_) => const Login());
      case RouteLiterals.forgotPasswordRoute:
        return CupertinoPageRoute(builder: (_) => const ForgotPassword());
      case RouteLiterals.resetPasswordRoute:
        return CupertinoPageRoute(builder: (_) => const ResetPassword());
      case RouteLiterals.dashBoardRoute:
        return CupertinoPageRoute(builder: (_) => const Dashboard());
      // case RouteLiterals.homeRoute:
      //   return CupertinoPageRoute(builder: (_) => const Home());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route specified for ${settings.name}'),
                  ),
                ));
    }
  }

}