import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants/global_variables.dart';
import 'package:unicons/unicons.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final String urlToImage;
  final String title;
  final String description;
  final String content;
  const ArticleDetailsScreen(
    {super.key,
      required this.urlToImage,
      required this.title,
      required this.description,
      required this.content}
  );

  void onSave() {}

  @override
  Widget build(BuildContext context) {
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
                  imageUrl: urlToImage,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      title,
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
                      "$description.$content",
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
