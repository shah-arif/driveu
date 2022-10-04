import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String text;
  VoidCallback function;
  MyButton({
    required this.text,required this.function,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(34),
      onTap: function,
      child: Container(
        height: 60,
        width: 286,
        decoration: BoxDecoration(
            color: Color(0xFF4267AF),
            borderRadius: BorderRadius.circular(34)
        ),
        child: Center(
          child: Text(text,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xFFFFFFFF)),),

        ),
      ),
    );
  }
}
