import 'package:flutter/material.dart';
import 'package:gallary_app/%20feauture/presentation/screens/main_screens/feed_screen/feed_screen.dart';
import 'package:gallary_app/%20feauture/presentation/screens/main_screens/pick_image/pick_image.dart';
import 'package:gallary_app/%20feauture/presentation/theme/colors.dart';

import '../profile_screen/profile_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;
  static List<Widget> widgetOptions = const [
    HomePage(),
    PickImage(),
    ProfileScreen(),
  ];

  void onItemTapped(int index) {
    setState(
      () {
        selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.pink,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined), label: 'Add photo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Profile'),
        ],
      ),
    );
  }
}
