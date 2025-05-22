import 'package:go_router/go_router.dart';
import 'package:news_hive/app/features/auth/auth_routes.dart';
import 'package:news_hive/app/features/main/main_route.dart';
import 'package:news_hive/app/features/onboarding/onboarding_route.dart';
import 'package:news_hive/app/features/splash/presentation/pages/splash_sceen_page.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return const SplashSceenPage();
      },
    ),
    onBoardingRoute,
    authRoute,
    mainRoute,
  ],
);
