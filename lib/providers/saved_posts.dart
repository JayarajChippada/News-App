import 'package:flutter/material.dart';
import 'package:news_app/models/article.dart';

class SavedPostsProvider extends ChangeNotifier {
  List<Article> _savedPosts = [];

  List<Article> get savedPosts => _savedPosts;

  bool isArticleSaved(Article article) {
    return _savedPosts.contains(article);
  }

  void addPost(Article article) {
    if (!isArticleSaved(article)) {
      _savedPosts.add(article);
      notifyListeners();
    }
  }

  void removePost(Article article) {
    if(isArticleSaved(article)) {
      _savedPosts.remove(article);
      notifyListeners();
    }
  }
}
