import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:news_hive/data/models/news_model.dart';

Future<List<NewsModel>> loadDummyNews() async {
  final String response = await rootBundle.loadString(
    'assets/data/dummy_list_news.json',
  );

  final List<dynamic> data = jsonDecode(response);
  return data.map((e) => NewsModel.fromJson(e)).toList();
}
