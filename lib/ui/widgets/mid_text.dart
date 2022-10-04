import 'package:flutter/material.dart';

class MidText extends StatelessWidget {
  FontWeight? fontWeight;
  String text;
  double size;
  MidText({
    required this.text,required this.size,this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.w400,
          color: Color(0xFFFFFFFF),
      ),
    );
  }
}