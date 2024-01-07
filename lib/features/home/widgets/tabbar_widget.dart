// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:news_app/constants/global_variables.dart';
import 'package:news_app/features/home/widgets/feed_widget.dart';

class MyTabBar extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  int currentIndex = 0;
  Key feedWidgetKey = UniqueKey(); // Unique key for FeedWidget

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FeedWidget(
            key: feedWidgetKey,
            currentIndex: currentIndex,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: GlobalVariables.categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    feedWidgetKey =
                        UniqueKey(); // Change the key to force recreation
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 50,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: currentIndex == index
                          ? GlobalVariables.secondaryColor
                          : GlobalVariables.greyBackgroundColor
                              .withOpacity(0.4),
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          GlobalVariables.categories[index]['category'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: currentIndex == index
                                ? Colors.white
                                : Colors.black.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
