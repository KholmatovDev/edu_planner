
import 'package:edu_planner/src/utils/extensions/push_replacement_extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'go_router.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void logOut() {}

  static BuildContext context = navigatorKey.currentContext!;
  final appGoRouter = AppGoRouter().router;

  static void clearAndNavigate(String path) {
    GoRouter.of(NavigationService.context).clearStackAndNavigate(path);
  }
}
