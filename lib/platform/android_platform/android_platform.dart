import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:penge_send/constants/colour_const.dart';
import 'package:penge_send/screens/bill_screen.dart';
import 'package:penge_send/screens/home_screen.dart';
import 'package:penge_send/screens/trans_scr_history.dart';
import 'package:penge_send/screens/user_screen.dart';

class AndroidPlatform extends StatefulWidget {
  const AndroidPlatform({super.key});

  @override
  State<AndroidPlatform> createState() => _AndroidPlatformState();
}

class _AndroidPlatformState extends State<AndroidPlatform> {
  int _page = 0;
  late PageController pageController;
  navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: const [
          HomeScreen(),
          TransactionHistory(),
          BillScreen(),
          UserScreen(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: navigationTapped,
        backgroundColor: kScalfoldBackgroundColour,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _page == 0 ? kCircleAvataIconColour : kSecondaryColour,
              ),
              label: '',
              backgroundColor: kSecondaryColour),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color: _page == 1 ? kCircleAvataIconColour : kSecondaryColour,
              ),
              label: '',
              backgroundColor: kSecondaryColour),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.payment,
                color: _page == 2 ? kCircleAvataIconColour : kSecondaryColour,
              ),
              label: '',
              backgroundColor: kSecondaryColour),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _page == 3 ? kCircleAvataIconColour : kSecondaryColour,
              ),
              label: '',
              backgroundColor: kSecondaryColour),
        ],
      ),
    );
  }
}
