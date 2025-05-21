import 'package:go_router/go_router.dart';
import 'package:news_hive/app/features/home/presentation/pages/home_page.dart';
import 'package:news_hive/app/router/routes.dart';

final GoRoute homeRoute = GoRoute(
  path: Routes.home,
  builder: (context, state) => const HomePage(),
);
