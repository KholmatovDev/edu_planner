
import 'package:edu_planner/src/presentation/screens/auth/auth_screen.dart';
import 'package:edu_planner/src/service/navigation/routing.dart';
import 'package:go_router/go_router.dart';

import '../transition/transitions.dart';
import 'navigation_service.dart';

class AppGoRouter {
  final router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: RoutingConstants.authScreen,
    routes: [
      /// TEST
      GoRoute(
        path: RoutingConstants.authScreen,
        pageBuilder: (context, state) => slideTransitionRight(state, const AuthScreen()),
      ),

    ],
  );
}
