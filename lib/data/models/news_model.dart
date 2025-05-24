class NewsModel {
  final String id;
  final String title;
  final List<String> category;
  final String date;
  final String image;
  final String summary;
  final NewsDetails details;

  NewsModel({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.image,
    required this.summary,
    required this.details,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      category: List<String>.from(json['category']),
      date: json['date'],
      image: json['image'],
      summary: json['summary'],
      details: NewsDetails.fromJson(json['details']),
    );
  }
}

class NewsDetails {
  final String title;
  final String content;

  NewsDetails({required this.title, required this.content});

  factory NewsDetails.fromJson(Map<String, dynamic> json) {
    return NewsDetails(title: json['title'], content: json['content']);
  }
}
