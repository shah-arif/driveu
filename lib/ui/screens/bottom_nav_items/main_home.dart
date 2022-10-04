import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.png"),fit: BoxFit.cover)
        ),
        child: null,
      )
    );
  }
}
