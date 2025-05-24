import 'package:flutter/material.dart';
import 'package:news_hive/app/app.dart';
import 'package:news_hive/provider/bookmark_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => BookmarkProvider())],
      child: const App(),
    ),
  );
}
