import 'dart:io';

import 'package:driveu/bloc/auth/auth_user.dart';
import 'package:driveu/ui/screens/auth_screen/login_screen.dart';
import 'package:driveu/ui/widgets/mid_text.dart';
import 'package:driveu/ui/widgets/my_button.dart';
import 'package:driveu/ui/widgets/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../bottom_nav_items/home_screen.dart';

class UserSignupScreen extends StatefulWidget {
  const UserSignupScreen({Key? key}) : super(key: key);

  @override
  State<UserSignupScreen> createState() => _UserSignupScreenState();
}

class _UserSignupScreenState extends State<UserSignupScreen> {
  final TextEditingController _fistNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();



  final _formKey = GlobalKey<FormState>();

  File? profilePic;
  Future getProfilePic()async{
    try {
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery);

      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.profilePic = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
      // MySnack().showSnack(context, Text("Failed to pick image"));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16,),
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        MidText(text: "Profile Picture", size: 16),
                        SizedBox(height: 16,),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 74,
                              width: 74,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors: [
                                    Color(0xFF103C87),
                                    Color(0xFF0E141E),
                                  ])
                              ),
                              child: profilePic != null ? ClipOval(child: Image.file(profilePic!,fit: BoxFit.cover,)) : Icon(CupertinoIcons.person,color: Color(0xFF8EA0AF),),
                            ),
                            Positioned(
                            bottom: -12,left: 22,child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(
                                    0xFF3C495E),
                              ),
                                height: 30,width: 30,child: Center(child: InkWell(onTap: (){
                              getProfilePic();
                            },child: Icon(Icons.add,color: Colors.blue,)),)))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 45,),
                MidText(text: "First Name *", size: 15),
                SizedBox(height: 8,),
                MyTextField(hintText: "Jason",textInputType: TextInputType.name,
                controller: _fistNameController,
                validator: (value){
                        if(value == null || value.isEmpty){
                          return "Input First Name";
                        }
                        return null;
                      }
                ),
                SizedBox(height: 8,),
                MidText(text: "Last Name *", size: 15),
                SizedBox(height: 8,),
                MyTextField(hintText: "Smith",textInputType: TextInputType.name,
                controller: _lastNameController,
                validator: (value){
                        if(value == null || value.isEmpty){
                          return "Input Last Name";
                        }
                        return null;
                      }
                ),
                SizedBox(height: 8,),
                MidText(text: "Email Address *", size: 15),
                SizedBox(height: 8,),
                MyTextField(hintText: "jasonsmith@gmail.com",textInputType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value){
                        if(value == null || value.isEmpty){
                          return "Input Email Address ";
                        }
                        return null;
                      }
                ),
                SizedBox(height: 8,),
                MidText(text: "Password *", size: 15,),
                SizedBox(height: 8,),
                MyTextField(hintText: "* * * * * * *",
                    controller: _passwordController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Input a Password";
                      }
                      return null;
                    }
                ),
                SizedBox(height: 8,),
                MidText(text: "Street Address", size: 15,),
                SizedBox(height: 8,),
                MyTextField(hintText: "Eg: 25/2 Bloc A, Lahore, PK",textInputType: TextInputType.streetAddress,
                controller: _addressController,
                validator: (value){
                        if(value == null || value.isEmpty){
                          return "Input Street Address";
                        }
                        return null;
                      }
                ),
                SizedBox(height: 8,),
                MidText(text: "City", size: 15),
                SizedBox(height: 8,),
                MyTextField(hintText: "Lahore",
                controller: _cityController,
                validator: (value){
                        if(value == null || value.isEmpty){
                          return "Input a City";
                        }
                        return null;
                      }
                ),
                SizedBox(height: 24,),
                Center(child: MyButton(text: "Register", function: (){
                  if(_formKey.currentState!.validate()){
                    AuthUser().createUserAccount(_emailController.text, _passwordController.text,context);
                  }
                })),
                SizedBox(height: 24,),
                Center(
                  child: RichText(text: TextSpan(text: "Already have an account? ",style: TextStyle(color: Color(0xFF4E646C)),children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen())),
                        text: "Login",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)
                    )
                  ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
