import 'package:flutter/material.dart';
import 'package:news_app/constants/global_variables.dart';
import 'package:news_app/features/search/screens/search_screen.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({super.key});

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  bool _isSearch = false;

  void navigateToSearchScreen(String searchQuery) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchScreen(searchQuery: searchQuery),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if(!_isSearch)
          const Text(
            "Browse News",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        if(_isSearch)
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
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide(color: Colors.black38, width: 1),
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ),

        if(_isSearch)
          GestureDetector(
            onTap: () {
              setState(() {
                _isSearch = false;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: GlobalVariables.greyBackgroundColor.withOpacity(0.4)),
                child: Center(
                  child: Icon(
                    Icons.close,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
            ),
          ),

        if(!_isSearch)
          GestureDetector(
            onTap: () {
              setState(() {
                _isSearch = true;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: GlobalVariables.greyBackgroundColor.withOpacity(0.4)),
              child: Center(
                child: Icon(
                  Icons.search,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          )
      ],
    );
  }
}
