import 'package:go_router/go_router.dart';
import 'package:shift_sync/features/auth/presentation/view/login_screen.dart';
import 'package:shift_sync/features/home/presentation/view/shifts_overview_screen.dart';
import 'package:shift_sync/features/splash/presentation/view/splash_screens.dart';

class AppRouter {
  static const String splash = 'splash';
  static const String loginScreen = 'loginScreen';
  static const String shiftsOverviewScreen = 'shiftsOverviewScreen';

  // 🔹 Router configuration
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: splash,
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        name: loginScreen,
        path: '/loginScreen',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: shiftsOverviewScreen,
        path: '/shiftsOverviewScreen',
        builder: (context, state) => const ShiftsOverviewScreen(),
      ),
    ],
  );
}
