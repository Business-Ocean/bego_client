import 'package:bego/routes/route_names.dart';
import 'package:bego/screens/home/page/home_page.dart';
import 'package:bego/screens/login/page/sign_in_sing_up_page.dart';
import 'package:bego/screens/login/page/verify_otp.dart';
import 'package:bego_app/go_router.dart';
import 'package:flutter/material.dart';

/// The route configuration.
final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.signInSignUP,
      builder: (BuildContext context, GoRouterState state) =>
          SignInSignUpPage(),
    ),
    GoRoute(
      path: AppRoutes.verfiyOTP,
      builder: (BuildContext context, GoRouterState state) => VerifyOTPPage(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (BuildContext context, GoRouterState state) => HomePage(),
    ),
  ],
);
