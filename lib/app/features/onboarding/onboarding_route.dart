import 'package:go_router/go_router.dart';
import 'package:news_hive/app/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:news_hive/app/router/routes.dart';

final GoRoute onBoardingRoute = GoRoute(
  path: Routes.onBoarding,
  builder: (context, state) => const OnboardingPage(),
);
