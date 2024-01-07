import 'package:flutter/material.dart';
import 'package:news_app/constants/global_variables.dart';
import 'package:news_app/features/home/screens/home_screen.dart';
import 'package:unicons/unicons.dart';

class MyBottomBar extends StatefulWidget {
  static const routeName = './actual-home';
  const MyBottomBar({super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _page = 0;
  PageController _pageController = PageController();
  
  double bottomBarWidth = 60;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) => updatePage(page),
        children:const [
          HomeScreen(),
          Center(child: Text("Saved"),),
          Center(child: Text("Profile"),),
          Center(child: Text("Menu"),),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _page,
          backgroundColor: GlobalVariables.backgroundColor,
          iconSize: 28,
          selectedItemColor: GlobalVariables.secondaryColor,
          unselectedItemColor: GlobalVariables.greyBackgroundColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
            
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          items:  [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    const Icon(UniconsLine.home_alt),
                    const SizedBox(width: 5,),
                    if(_page == 0) 
                      const Text('Home', style: TextStyle(
                        color: GlobalVariables.secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),)
                  ],
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Row(
                children: [
                  const Icon(UniconsLine.bookmark),
                  const SizedBox(
                    width: 5,
                  ),
                  if (_page == 1)
                    const Text(
                      'Saved',
                      style: TextStyle(
                          color: GlobalVariables.secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                ],
              ),
              label: "",
            ),
             BottomNavigationBarItem(
              icon: Row(
                children: [
                  const Icon(UniconsLine.user),
                  const SizedBox(
                    width: 5,
                  ),
                  if (_page == 2)
                    const Text(
                      'Profile',
                      style: TextStyle(
                          color: GlobalVariables.secondaryColor, 
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                ],
              ),
              label: "",
            ),     
             BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    const Icon(UniconsLine.list_ul),
                    const SizedBox(
                      width: 5,
                    ),
                    if (_page == 3)
                      const FittedBox(
                        child:  Text(
                          'Menu',
                          style: TextStyle(
                              color: GlobalVariables.secondaryColor, 
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                  ],
                ),
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
