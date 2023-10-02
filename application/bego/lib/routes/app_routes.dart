import 'package:bego/routes/route_names.dart';
import 'package:bego/screens/home/controller/home_controller.dart';
import 'package:bego/screens/home/page/home_page.dart';
import 'package:bego/screens/home/state/home_state.dart';
import 'package:bego/screens/login/controller/sign_in_sign_up_controller.dart';
import 'package:bego/screens/login/page/sign_in_sing_up_page.dart';
import 'package:bego/screens/login/state/sign_in_sing_up_state.dart';
import 'package:bego_app/go_router.dart';
import 'package:flutter/material.dart';

/// The route configuration.
final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.signInSignUP,
      builder: (BuildContext context, GoRouterState state) => SignInSignUpPage(
        controller: SignInSignUpController(SignInSignUpState.initial()),
      ),
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.home,
          builder: (BuildContext context, GoRouterState state) =>
              HomePage(controller: HomeController(HomeState.initial())),
        ),
      ],
    ),
  ],
);
