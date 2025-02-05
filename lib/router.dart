import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:lxp_flutter_dart/repositories/auth_repo.dart';
import 'package:lxp_flutter_dart/repositories/notification_repo.dart';
import 'package:lxp_flutter_dart/repositories/weather_repo.dart';
import 'package:lxp_flutter_dart/view_models/api_view_model.dart';
import 'package:lxp_flutter_dart/view_models/auth_view_model.dart';
import 'package:lxp_flutter_dart/view_models/home_view_model.dart';
import 'package:lxp_flutter_dart/view_models/notification_view_model.dart';
import 'package:lxp_flutter_dart/views/api_view.dart';
import 'package:lxp_flutter_dart/views/auth_view.dart';
import 'package:lxp_flutter_dart/views/home_view.dart';
import 'package:lxp_flutter_dart/views/notification_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomeView(viewModel: HomeViewModel());
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/auth',
          builder: (BuildContext context, GoRouterState state) {
            return AuthView(viewModel: AuthViewModel(authRepo: AuthRepo()));
          },
        ),
        GoRoute(
          path: '/notification',
          builder: (BuildContext context, GoRouterState state) {
            return NotificationView(
                viewModel: NotificationViewModel(
                    notificationRepo: NotificationRepo()));
          },
        ),
        GoRoute(
          path: '/api',
          builder: (BuildContext context, GoRouterState state) {
            return ApiView(viewModel: ApiViewModel(weatherRepo: WeatherRepo()));
          },
        ),
      ],
    ),
  ],
);
