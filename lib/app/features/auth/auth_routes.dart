import 'package:go_router/go_router.dart';
import 'package:news_hive/app/features/auth/presentation/pages/login_page.dart';
import 'package:news_hive/app/features/auth/presentation/pages/register_page.dart';
import 'package:news_hive/app/router/routes.dart';

final GoRoute authRoute = GoRoute(
  path: Routes.auth,
  redirect: (context, state) {
    if (state.fullPath == '/auth') {
      return Routes.login;
    }
    return null;
  },
  routes: [
    GoRoute(
      path: Routes.loginPath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.registerPath,
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);
