import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/global_variables.dart';
import 'package:news_app/models/article.dart';
import 'package:news_app/providers/saved_posts.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final Article article;
  const ArticleDetailsScreen({
    super.key,
    required this.article,
  });

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  bool _isSaved = false;
  @override
  Widget build(BuildContext context) {
    var savedPostProvider = Provider.of<SavedPostsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CachedNetworkImage(
                  height: MediaQuery.of(context).size.height * 0.45,
                  imageUrl: widget.article.urlToImage,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                        onTap: () {
                          _isSaved ? savedPostProvider.removePost(widget.article) 
                          : savedPostProvider.addPost(widget.article);
                          setState(() {
                            _isSaved = !_isSaved;
                          });
                        },
                        child: _isSaved ? 
                        const Icon(
                          UniconsSolid.bookmark,
                          size: 36,
                          color: GlobalVariables.backgroundColor,
                        )
                        : const Icon(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      widget.article.title,
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
                      "${widget.article.description}.${widget.article.content}",
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
      ),
    );
  }
}
