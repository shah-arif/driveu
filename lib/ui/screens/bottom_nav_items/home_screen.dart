import 'dart:async';

import 'package:driveu/ui/screens/ltv_drivers.dart';
import 'package:driveu/ui/widgets/mid_text.dart';
import 'package:flutter/material.dart';

import '../htv_drivers.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({
    Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool ltvSelected = false;
  bool htvSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/bg.png"),fit: BoxFit.cover,)
      ),
      child: Column(
        children: [
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.menu,size: 25,)),
              MidText(text: "Home", size: 18,fontWeight: FontWeight.w600,),
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications,size: 25,)),
            ],
          ),
          SizedBox(height: 150,),
          InkWell(
            onTap: (){
              setState(() {
                ltvSelected = true;
                htvSelected = false;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LtvDrivers()));
                // Timer(Duration(seconds: 2), () { });
              });
            },
            child: Container(
              height: 150,
              width: 351,
              decoration: BoxDecoration(
                  border: Border.all(width: ltvSelected ? 2 : 1,color: Colors.white),
                  color: ltvSelected ? Color(0xFF3734F8) : Color(0xFF4267AF),
                  borderRadius: BorderRadius.circular(46)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/ltvlogo.png",width: 104,height: 78,fit: BoxFit.cover,),
                    MidText(text: "LTV", size: 36,fontWeight: FontWeight.w500,)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 56,),
          InkWell(
            onTap: (){
              setState(() {
                htvSelected = true;
                ltvSelected= false;
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HtvDrivers()));
              });
            },
            child: Container(
              height: 150,
              width: 351,
              decoration: BoxDecoration(
                  border: Border.all(width: htvSelected ? 2 : 1,color: Colors.white),
                  color: htvSelected ? Color(0xFF3734F8) : Color(0xFF4267AF),
                  borderRadius: BorderRadius.circular(46)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/htvlogo.png",width: 104,height: 78,fit: BoxFit.cover,),
                    MidText(text: "HTV", size: 36,fontWeight: FontWeight.w500,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
