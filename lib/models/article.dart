import 'dart:convert';

class Article {
  final Map<String, dynamic> source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});

  Map<String, dynamic> toMap() {
    return {
      "source": source,
      "author": author,
      "title": title,
      "description": description,
      "url": url,
      "urlToImage": urlToImage,
      "pubilshedAt": publishedAt,
      "content": content
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      source: map['source'],
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? ''
    );
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Article.fromJson(String source) {
    return Article.fromMap(json.decode(source));
  }
}
