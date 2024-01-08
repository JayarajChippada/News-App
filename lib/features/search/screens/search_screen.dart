// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:news_app/common/loader.dart';
import 'package:news_app/constants/global_variables.dart';
import 'package:news_app/constants/utilis.dart';
import 'package:news_app/features/search/screens/article_details_screen.dart';
import 'package:news_app/features/search/services/search_services.dart';
import 'package:news_app/features/search/widgets/searched_article.dart';
import 'package:news_app/models/article.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.searchQuery});
  final String searchQuery;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Article>? articles;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    fetchArticles();
    super.initState();
  }

  void navigateToSearchScreen(String searchQuery) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(searchQuery: searchQuery),
      ),
    );
  }

  void navigateToArticleDetailsScreen({
  required Article article,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  ArticleDetailsScreen(
          article: article,
        ),
      ),
    );
  }

  void fetchArticles() async {
    try {
      articles = await searchServices.fetchArticles(
          context: context, query: widget.searchQuery);
      setState(() {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    if (articles == null || articles!.isEmpty) {
      return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: const Center(child: Loader()));
    }
    return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      color: GlobalVariables.backgroundColor),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 42,
                        margin: const EdgeInsets.only(left: 15),
                        child: Material(
                          borderRadius: BorderRadius.circular(7),
                          elevation: 1,
                          child: TextFormField(
                            onFieldSubmitted: navigateToSearchScreen,
                            decoration: InputDecoration(
                                prefixIcon: InkWell(
                                  onTap: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 6),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 23,
                                    ),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(top: 10),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  borderSide: BorderSide(
                                      color: Colors.black38, width: 1),
                                ),
                                hintText: 'Search',
                                hintStyle: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                articles == null
                    ? const Loader()
                    : Expanded(
                        child: ListView.builder(
                          itemCount: articles!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: () => navigateToArticleDetailsScreen(
                                  article: articles![index]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SearchedArticle(
                                    urlToImage: articles![index].urlToImage,
                                    title: articles![index].title,
                                  ),
                                ));
                          },
                        ),
                      ),
              ],
            ),
          );
  }
}
