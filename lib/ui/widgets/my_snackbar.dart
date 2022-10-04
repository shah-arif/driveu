import 'package:flutter/material.dart';

class MySnack{
  showSnack(context,content){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content));
  }
}