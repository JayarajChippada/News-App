import 'package:flutter/material.dart';
import 'package:news_app/features/home/widgets/tabbar_widget.dart';
import 'package:news_app/features/home/widgets/top_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              const TopWidget(),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: MyTabBar()),
            ],
          ),
        ),
      ),
    );
  }
}
