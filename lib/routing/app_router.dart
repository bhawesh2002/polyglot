import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:polyglot/data/repositories_provider.dart';
import 'package:polyglot/routing/app_routes.dart';
import 'package:polyglot/ui/auth/views/auth_view.dart';
import 'package:polyglot/ui/home/views/home_view.dart';
import 'package:polyglot/ui/splash/views/splash_view.dart';

final appRouterProvider = Provider((ref) {
  final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        name: AppRoutes.splash,
        path: "/",
        redirect: (context, state) async {
          await ref.read(storageRepositoryProvier).initialize();
          return null;
        },
        builder: (context, state) {
          return SplashView();
        },
      ),
      GoRoute(
        name: AppRoutes.auth,
        path: AppRoutes.auth,
        builder: (context, state) {
          return AuthView();
        },
      ),
      GoRoute(
        name: AppRoutes.home,
        path: AppRoutes.home,
        builder: (context, state) {
          return HomeView();
        },
      ),
    ],
  );
  return router;
});
