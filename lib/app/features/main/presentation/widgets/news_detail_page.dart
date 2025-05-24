import 'package:flutter/material.dart';
import 'package:news_hive/data/models/news_model.dart';
import 'package:news_hive/data/services/news_service.dart';
import 'package:news_hive/provider/bookmark_provider.dart';
import 'package:provider/provider.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key, required this.newsId});

  final String newsId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>>(
      future: loadDummyNews(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: Text("Loading..."));

        final news = snapshot.data!.firstWhere((n) => n.id == newsId);

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Image.network(news.image, fit: BoxFit.cover),
                const SizedBox(height: 12),
                Text(
                  news.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(news.details.content),
              ],
            ),
          ),
        );
      },
    );
  }
}
