import 'package:blog_app/app_theme.dart';
import 'package:blog_app/constants.dart';
import 'package:blog_app/home/controller/home_controller.dart';
import 'package:blog_app/home/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'add_post_screen.dart';
import 'feed_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, data, _) => Scaffold(
        body: PageView(
          controller: data.pageController,
          onPageChanged: (index) => data.onPageChanged(index),
          children: [
            FeedScreen(),
            AddPostScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: data.pageIndex,
          onTap: (index) => data.onTapBottomNav(index),
          selectedItemColor: kPrimaryColor,
          elevation: 0,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.home,
                size: 25,
              ),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.add,
                  size: 40,
                ),
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
                size: 25,
              ),
              label: 'Feed',
            ),
          ],
        ),
      ),
    );
  }
}
