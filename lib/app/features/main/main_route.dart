import 'package:go_router/go_router.dart';
import 'package:news_hive/app/features/main/presentation/pages/main_page.dart';
import 'package:news_hive/app/features/main/presentation/widgets/news_detail_page.dart';
import 'package:news_hive/app/router/routes.dart';

final GoRoute mainRoute = GoRoute(
  path: Routes.home,
  builder: (context, state) => const MainPage(),
  routes: [
    GoRoute(
      path: Routes.newsDetailPath,
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return NewsDetailPage(newsId: id);
      },
    ),
  ],
);
