import 'package:christy/core/theming/colors.dart';
import 'package:christy/features/home/ui/home_Screen.dart';
import 'package:christy/features/search_friend/ui/search_friend.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../get_friends_reques/ui/requests_friend.dart';

class HomeBottomNav extends StatefulWidget {
  @override
  _HomeBottomNavState createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    const AddFriendScreen(),
    const RequestsFriend(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60.0,
        items: <Widget>[
          SvgPicture.asset('assets/svgs/Home.svg',color: Colors.black),
          SvgPicture.asset('assets/svgs/add.svg',color: Colors.black),
          SvgPicture.asset('assets/svgs/Setting.svg',color: Colors.black),
        ],
        color:  Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
