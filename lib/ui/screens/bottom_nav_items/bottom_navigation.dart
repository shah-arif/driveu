import 'package:driveu/ui/screens/bottom_nav_items/home_screen.dart';
import 'package:driveu/ui/screens/bottom_nav_items/main_home.dart';
import 'package:driveu/ui/screens/bottom_nav_items/my_driver.dart';
import 'package:driveu/ui/screens/bottom_nav_items/my_profile.dart';
import 'package:driveu/ui/screens/onboarding.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    // MainHome(),
    MyDriver(),
    MyProfile(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: SizedBox(
      height: 80,
      child: BottomNavigationBar(
        iconSize: 30,
        currentIndex: _currentIndex,
          selectedItemColor: Color(0xFF00A3FE),
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
          unselectedItemColor: Color(0xFF5E6D7B),
        backgroundColor: Color(0xFF0E141E),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled,semanticLabel: "Home",),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.drive_eta_rounded,semanticLabel: "My Driver",),label: "My Driver"),
          BottomNavigationBarItem(icon: Icon(Icons.manage_accounts_rounded,semanticLabel: "My Profile",),label: "My Profile"),
        ]),
    ),
      body: pages[_currentIndex],
    );
  }
}
