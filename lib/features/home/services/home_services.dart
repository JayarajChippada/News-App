// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/constants/error_handlings.dart';
import 'package:news_app/constants/global_variables.dart';
import 'package:news_app/constants/utilis.dart';
import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;

class HomeServices {
  Future<List<Article>> fetchTrendingArticles(
      {required BuildContext context,
      required String category,
      required String subCategory}) async {
        List<Article>? articles = [];
    try {
      http.Response res = await http.get(Uri.parse(
        '$uri/top-headlines?country=in&category=$category&q=$subCategory&apiKey=$apiKey',
      ));

      var jsonData = jsonDecode(res.body);

      httpErrorHandles(
        context: context,
        response: res,
        onSuccess: () {
          for (int i = 0; i < jsonData['articles'].length; i++) {
            if(jsonData['articles'][i]['urlToImage'] != null && jsonData['articles'][i]['description'] != null) {
              articles.add(Article.fromJson(jsonEncode(jsonData['articles'][i])));
            }
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return articles;
  }
}
