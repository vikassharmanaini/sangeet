import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sangeet/utils/routes.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key, required this.index});
  final int index;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "bottomnav",
      child: BottomNavigationBar(
        currentIndex: widget.index,
        onTap: (index) {
          Get.offNamed([
            AppRoutes.root,
            AppRoutes.search,
            AppRoutes.library,
            AppRoutes.downloads
          ][index]);
        },
        selectedItemColor: Get.theme.indicatorColor,
        unselectedItemColor: Get.theme.splashColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.rectangle_stack), label: "Library"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.arrow_down_circle), label: "Downloads"),
        ],
      ),
    );
  }
}
