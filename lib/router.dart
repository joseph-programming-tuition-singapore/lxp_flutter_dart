import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:lxp_flutter_dart/repositories/auth_repo.dart';
import 'package:lxp_flutter_dart/view_models/auth_view_model.dart';
import 'package:lxp_flutter_dart/view_models/home_view_model.dart';
import 'package:lxp_flutter_dart/views/auth_view.dart';
import 'package:lxp_flutter_dart/views/home_view.dart';

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
            })
      ],
    ),
  ],
);
