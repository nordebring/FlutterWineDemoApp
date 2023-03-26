import 'package:auto_route/auto_route.dart';
import 'package:basic_login/presentation/views/wine_list.dart';
import 'package:basic_login/presentation/views/login.dart';
import 'package:flutter/material.dart';
import '../../domain/models/wine.dart';
import '../../presentation/views/wine_details.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: LoginView, initial: true),
    AutoRoute(page: WineList),
    AutoRoute(page: WineDetailsView),
  ],
)
class AppRouter extends _$AppRouter {}

final appRouter = AppRouter();
