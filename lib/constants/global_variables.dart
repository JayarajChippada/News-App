import 'package:flutter/material.dart';

String uri = "https://newsapi.org/v2";
String apiKey = "48ae56810bb446e3bb7afc54d47c5486";

class GlobalVariables {
  static const secondaryColor = Color(0xFFE56924);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundColor = Color(0xFFA9A9A9);
  static const selNavBarColor = Color(0xFFE56924);
  static const unselectedNavBarColor = Color(0xFFEEF5FF);
  static const textColor = Colors.black;

  static const List<Map<String, dynamic>> categories = [
    {
      "category": "Sports",
      "subcategory": ["All", "Cricket", "Basketball", "Football"]
    },
    {
      "category": "Science",
      "subcategory": ["All","Space", "Physics", "Earth"]
    },
    {
      "category": "Health",
      "subcategory": ["All", "Medical", "Healthcare", "Mental Health"]
    },
    {
      "category": "Bussiness",
      "subcategory": ["All", "Financial", "Industry", "Economic"]
    },
    {
      "category": "Technology",
      "subcategory": ["All", "Security", "AI", "Iot"]
    },
    {
      "category": "Politics",
      "subcategory": ["All"]
    },
  ];
}
