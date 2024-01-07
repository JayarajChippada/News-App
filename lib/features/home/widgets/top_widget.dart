import 'package:flutter/material.dart';
import 'package:news_app/constants/global_variables.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Browse News",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: GlobalVariables.greyBackgroundColor.withOpacity(0.4)
            ),
            child:  Center(
              child: Icon(Icons.search, color: Colors.black.withOpacity(0.4),),
            ),
          ),
        )
      ],
    );
  }
}