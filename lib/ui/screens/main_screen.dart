import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:test/helper/constants/colors.dart';
import 'package:test/helper/constants/image_paths.dart';
import 'package:test/ui/screens/notification.dart';

import 'discussion_forums.dart';
import 'home.dart';
import 'profile.dart';
import 'scan_qr.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ColorHepler _colorHepler = ColorHepler();
  final ImagePaths _imagePaths = ImagePaths();
  int _page = 2;

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List<Widget> screens = [
    DiscussionScreen(),
    ScanQrScreen(),
    HomeScreen(),
    // BlogsScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: CurvedNavigationBar(
          index: 2,
          height: 60,
          buttonBackgroundColor: _colorHepler.brand,
          backgroundColor: Colors.transparent,
          color: const Color.fromARGB(255, 246, 246, 246),
          animationDuration: const Duration(milliseconds: 700),
          items: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.eco_outlined,
                color: _page == 0 ? Colors.white : Colors.black,
              ),
              // child: Image.asset(
              //   _imagePaths.treeLeafsIcon,
              //   color: _page == 0 ? Colors.white : Colors.black,
              //   fit: BoxFit.cover,
              //   width: _page == 0 ? 15 : 13,
              // ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                _imagePaths.qr,
                color: _page == 1 ? Colors.white : Colors.black,
                fit: BoxFit.cover,
                width: _page == 1 ? 20 : 17,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                _imagePaths.home,
                color: _page == 2 ? Colors.white : Colors.black,
                fit: BoxFit.cover,
                width: _page == 2 ? 20 : 17,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                _imagePaths.bell,
                color: _page == 3 ? Colors.white : Colors.black,
                fit: BoxFit.cover,
                width: _page == 3 ? 22 : 19,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                _imagePaths.personIcon,
                color: _page == 4 ? Colors.white : Colors.black,
                fit: BoxFit.cover,
                width: _page == 4 ? 20 : 17,
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: screens[_page],
      ),
    );
  }
}
