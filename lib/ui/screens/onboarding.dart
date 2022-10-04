
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:driveu/ui/screens/auth_screen/login_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/mid_text.dart';
import '../widgets/my_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List titleList = ["Connecting drivers to Needers","Sign up now for hiring experienceddrivers","Number one drivers app in the world"];
  int _currentPosition = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo/logo.png",),
            SizedBox(height: 120,),
            Text("Welcome to\nDriveU",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Color(0xFF91AFDF)),),
            SizedBox(height: 16,),
            // Text(titleList[0],textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Color(0xFFFFFFFF)),),
            Container(
              child: CarouselSlider(
                options: CarouselOptions(height: 50,autoPlay: true,viewportFraction: 1,
                    onPageChanged: (index,reason){
                  setState(() {
                    _currentPosition = index;
                  });
                    }
                ),
                items: titleList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return MidText(text: "$i",size: 20,);
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 34,),
            DotsIndicator(
              dotsCount: titleList.length,
              position: _currentPosition.toDouble(),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(height: 24,),
            MyButton(text: "Get Started",function: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            },)
          ],
        ),
      ),
    );
  }
}


