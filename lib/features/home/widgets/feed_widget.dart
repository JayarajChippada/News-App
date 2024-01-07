// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/loader.dart';
import 'package:news_app/constants/global_variables.dart';
import 'package:news_app/constants/utilis.dart';
import 'package:news_app/features/home/screens/article_screen.dart';
import 'package:news_app/features/home/services/home_services.dart';
import 'package:news_app/models/article.dart';

class FeedWidget extends StatefulWidget {
  final int currentIndex;

  const FeedWidget({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  int selectedSubcategoryIndex = 0;
  final HomeServices homeServices = HomeServices();
  List<Article>? articles = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  void fetchNews() async {
    try {
      articles = await homeServices.fetchTrendingArticles(
        context: context,
        category: GlobalVariables.categories[widget.currentIndex]['category'],
        subCategory: GlobalVariables.categories[widget.currentIndex]
            ['subcategory'][selectedSubcategoryIndex],
      );
      setState(() {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: SizedBox(
            height: 50,
            child: Row(
              children: List<Widget>.from(
                GlobalVariables.categories[widget.currentIndex]['subcategory']
                    .asMap()
                    .entries
                    .map(
                      (entry) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSubcategoryIndex = entry.key;
                          });
                          fetchNews();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            entry.value,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: entry.key == selectedSubcategoryIndex
                                  ? Colors.black.withOpacity(0.8)
                                  : Colors.black.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ),
                    ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleScreen(
                    categoryIndex: widget.currentIndex,
                    subCategoryIndex: selectedSubcategoryIndex,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                if (articles != null && articles!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      height: MediaQuery.of(context).size.height * 0.6,
                      imageUrl: articles![0].urlToImage,
                      fit: BoxFit.fitHeight,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )
                 
                else
                  const Center(
                    child: Loader(),
                  ),
            
              if(articles != null && articles!.isNotEmpty)  
                  Positioned(
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            articles![0].publishedAt,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 16
                            ),
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            width: 250,
                            child: Text(
                              articles![0].title,
                              maxLines: 3,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
