// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/common/loader.dart';
import 'package:news_app/constants/global_variables.dart';
import 'package:news_app/constants/utilis.dart';
import 'package:news_app/features/home/services/home_services.dart';
import 'package:news_app/models/article.dart';
import 'package:unicons/unicons.dart';

class ArticleScreen extends StatefulWidget {
  final int categoryIndex;
  final int subCategoryIndex;

  const ArticleScreen({
    Key? key,
    required this.categoryIndex,
    required this.subCategoryIndex,
  }) : super(key: key);

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final HomeServices homeServices = HomeServices();
  List<Article>? articles;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  void fetchNews() async {
    try {
      articles = await homeServices.fetchTrendingArticles(
        context: context,
        category: GlobalVariables.categories[widget.categoryIndex]['category'],
        subCategory: GlobalVariables.categories[widget.categoryIndex]
            ['subcategory'][widget.subCategoryIndex],
      );
      setState(() {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void onSave() {
    
  }

  @override
  Widget build(BuildContext context) {
    if (articles == null || articles!.isEmpty) {
      // Handle the case when articles is null or empty
      return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: const Center(child: Loader()));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title:
            Text(GlobalVariables.categories[widget.categoryIndex]['category']),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: articles!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      height: MediaQuery.of(context).size.height * 0.4,
                      imageUrl: articles![index].urlToImage,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: onSave,
                        child: const Icon(
                          UniconsLine.bookmark,
                          size: 35,
                          color: GlobalVariables.backgroundColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          articles![index].title,
                          maxLines: 4,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "${articles![index].description}.${articles![index].content}",
                          maxLines: 15,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
