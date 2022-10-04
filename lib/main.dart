import 'package:driveu/ui/draft.dart';
import 'package:driveu/ui/screens/bottom_nav_items/bottom_navigation.dart';
import 'package:driveu/ui/screens/bottom_nav_items/home_screen.dart';
import 'package:driveu/ui/screens/bottom_nav_items/main_home.dart';
import 'package:driveu/ui/screens/onboarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0E141E),
        iconTheme: IconThemeData(color: Colors.white)
      ),
      debugShowCheckedModeBanner: false,
      home:
        // Draft()
      // HomeScreen()
      // BottomNavigation()
      // MainHome()

      Onboarding(),
    );
  }
}
