
import 'package:edu_planner/src/presentation/screens/auth/auth_screen.dart';
import 'package:edu_planner/src/presentation/screens/auth/register_screen.dart';
import 'package:edu_planner/src/presentation/screens/splash/splash_screen.dart';
import 'package:edu_planner/src/service/navigation/routing.dart';
import 'package:go_router/go_router.dart';

import '../transition/transitions.dart';
import 'navigation_service.dart';

class AppGoRouter {
  final router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: RoutingConstants.splash,
    routes: [
      GoRoute(
        path: RoutingConstants.splash,
        pageBuilder: (context, state) => slideTransitionRight(state, const SplashScreen()),
      ),

      GoRoute(
        path: RoutingConstants.authScreen,
        pageBuilder: (context, state) => slideTransitionRight(state, const AuthScreen()),
      ),
      GoRoute(
        path: RoutingConstants.register,
        pageBuilder: (context, state) => slideTransitionRight(state, const RegisterScreen()),
      ),

    ],
  );
}
