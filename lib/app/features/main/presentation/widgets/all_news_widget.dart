import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_hive/data/models/news_model.dart';
import 'package:news_hive/data/services/news_service.dart';
import 'package:news_hive/provider/bookmark_provider.dart';
import 'package:provider/provider.dart';

class AllNewsWidget extends StatelessWidget {
  const AllNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: loadDummyNews(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();
        final newsList = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: newsList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final news = newsList[index];
            return GestureDetector(
              onTap: () => context.go('/home/news/${news.id}'),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      news.image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(news.category.join(", ")),
                        const SizedBox(height: 4),
                        Text(
                          news.date,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      context.watch<BookmarkProvider>().isBookmarked(news.id)
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                    ),
                    onPressed: () {
                      context.read<BookmarkProvider>().toggleBookmark(news);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
