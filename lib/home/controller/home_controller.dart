import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  int tabIndex = 0;
  final PageController pageController = PageController();
  int pageIndex = 0;

  void changeTab(int index) {
    tabIndex = index;
    notifyListeners();
  }

  void onPageChanged(int index) {
    pageIndex = index;
    notifyListeners();
  }

  void onTapBottomNav(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 150),
      curve: Curves.easeIn,
    );

    notifyListeners();
  }
}
