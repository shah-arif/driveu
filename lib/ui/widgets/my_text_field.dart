import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  TextEditingController? controller;
  String hintText;
  Widget? widget;
  TextInputType? textInputType;
  String? Function(String?)? validator;
  int? maxLength;
  MyTextField({
    required this.hintText,this.widget,this.textInputType,this.validator,this.maxLength,this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLength: maxLength,
      keyboardType: textInputType,
      style: TextStyle(color: Colors.white,fontSize: 14),
      decoration: InputDecoration(
          counterStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.only(top: 18,bottom: 18,left: 15,right: 15),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: widget,
          hintText: hintText,
          fillColor: Color(0xFF282E37),
          filled: true,
          hintStyle: TextStyle(color: Color(0xFFCBD3DC),fontSize: 14)
      ),
      validator: validator,
    );
  }
}
