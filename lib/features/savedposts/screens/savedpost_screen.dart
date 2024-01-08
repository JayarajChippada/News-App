import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/loader.dart';
import 'package:news_app/constants/global_variables.dart';
import 'package:news_app/providers/saved_posts.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class SavedPostsScreen extends StatefulWidget {
  const SavedPostsScreen({super.key});

  @override
  State<SavedPostsScreen> createState() => _SavedPostsScreenState();
}

class _SavedPostsScreenState extends State<SavedPostsScreen> {
  @override
  Widget build(BuildContext context) {
    final savedProvider = Provider.of<SavedPostsProvider>(context);
    final articles = savedProvider.savedPosts;
    if (articles.isEmpty) {
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
        centerTitle: false,
        title: const Text("Saved Posts"),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      height: MediaQuery.of(context).size.height * 0.4,
                      imageUrl: articles[index].urlToImage,
                      fit: BoxFit.fill,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: () {
                          savedProvider.removePost(articles[index]);
                          setState(() {});
                        },
                        child: const Row(
                          children: [
                            Text("UnSave", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              UniconsLine.bookmark,
                              size: 35,
                              color: GlobalVariables.backgroundColor,
                            ),
                          ],
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
                          articles[index].title,
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
                          "${articles[index].description}.${articles[index].content}",
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
