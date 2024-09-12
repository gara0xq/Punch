import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch/screens/apps_screen.dart';
import 'package:punch/screens/home_screen.dart';
import 'package:punch/screens/profile_screen.dart';

class BottomNavController extends GetxController {
  int pageIndex = 0;

  final pages = [
    HomeScreen(),
    AppsScreen(),
    ProfileScreen(),
  ];
  changeIndex(int index) {
    pageIndex = index;
    update();
  }

  Widget getPage() {
    return pages[pageIndex];
  }
}
