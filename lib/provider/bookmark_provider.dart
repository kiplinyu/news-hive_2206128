import 'package:flutter/material.dart';
import 'package:news_hive/data/models/news_model.dart';

class BookmarkProvider extends ChangeNotifier {
  final List<NewsModel> _bookmarked = [];

  List<NewsModel> get items => _bookmarked;

  bool isBookmarked(String id) {
    return _bookmarked.any((item) => item.id == id);
  }

  void toggleBookmark(NewsModel news) {
    final isExist = _bookmarked.any((item) => item.id == news.id);
    if (isExist) {
      _bookmarked.removeWhere((item) => item.id == news.id);
    } else {
      _bookmarked.add(news);
    }
    notifyListeners();
  }
}
