import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchedArticle extends StatelessWidget {
  final String urlToImage;
  final String title;
  const SearchedArticle({super.key, required this.urlToImage, required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            imageUrl: urlToImage,
            fit: BoxFit.fitWidth,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Positioned(
            right: 0,
            bottom: 15,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                overflow: TextOverflow.clip,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
