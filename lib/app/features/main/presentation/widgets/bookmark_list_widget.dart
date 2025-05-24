import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_hive/provider/bookmark_provider.dart';
import 'package:provider/provider.dart';

class BookmarkListWidget extends StatelessWidget {
  const BookmarkListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarks = context.watch<BookmarkProvider>().items;

    if (bookmarks.isEmpty) {
      return const Center(child: Text("No bookmarks yet."));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: bookmarks.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final news = bookmarks[index];
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
                    Text(news.date, style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.bookmark_remove),
                onPressed:
                    () => context.read<BookmarkProvider>().toggleBookmark(news),
              ),
            ],
          ),
        );
      },
    );
  }
}
