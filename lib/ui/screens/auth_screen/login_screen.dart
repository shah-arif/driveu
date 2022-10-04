import 'package:driveu/bloc/auth/auth_user.dart';
import 'package:driveu/ui/screens/bottom_nav_items/home_screen.dart';
import 'package:driveu/ui/screens/auth_screen/choose_account_type.dart';
import 'package:driveu/ui/screens/auth_screen/user_signup_screen.dart';
import 'package:driveu/ui/widgets/mid_text.dart';
import 'package:driveu/ui/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../widgets/my_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailOrPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  bool isHidden = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/logo/logo.png",height: 75,width: 70,),
                SizedBox(height: 106,),
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MidText(text: "Email Address Or Phone", size: 15),
                        SizedBox(height: 8,),
                        MyTextField(textInputType: TextInputType.emailAddress,hintText: "E-mail",

                            controller: _emailOrPhoneController,
                            validator: (value){
                          if(value == null || value.isEmpty){
                            return "Input an email address";
                          }
                          return null;
                        }),
                        SizedBox(height: 24,),
                        MidText(text: "Password", size: 15),
                        SizedBox(height: 8,),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: isHidden,
                        style: TextStyle(color: Colors.white,fontSize: 14),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 18,bottom: 18,left: 15,right: 15),
                            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 2),
                              child: Material(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)))
                                  ,color: Color(0xFF282E37),child: IconButton(onPressed: (){
                                    setState(() {
                                      isHidden =! isHidden;
                                    });
                              }, icon: Icon(Icons.remove_red_eye,size: 20,))),
                            ),
                            hintText: "Password",
                            fillColor: Color(0xFF282E37),
                            filled: true,
                            hintStyle: TextStyle(color: Color(0xFFCBD3DC),fontSize: 14)
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Input an email address";
                          }
                          return null;
                        }
                      ),
                        SizedBox(height: 12,),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: (){},
                            child: Text("Forgot Password",style: TextStyle(
                                shadows: [
                                  Shadow(
                                      color: Color(0xFFFFFFFF),
                                      offset: Offset(0, -5))
                                ],
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                decorationStyle: TextDecorationStyle.solid,
                                decorationColor: Colors.white,
                                decorationThickness: 1,
                                fontWeight: FontWeight.w400,
                                color: Colors.transparent
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 87,),
                Container(
                  child: Column(
                    children: [
                      MyButton(text: "Login", function: (){
                        if(_formKey.currentState!.validate()){
                          AuthUser().signInUser(_emailOrPhoneController.text, _passwordController.text, context);
                        }
                      }),
                      SizedBox(height: 24,),
                      MidText(text: "Or Continue With", size: 14),
                      SizedBox(height: 17,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(onTap: (){
                            // AuthUser().signInWithGoogle(context);
                          },child: Image.asset("assets/logo/google.png",height: 25,width: 25,)),
                          SizedBox(width: 23,),
                          InkWell(onTap: (){},child: Image.asset("assets/logo/twitter.png",height: 25,width: 25,)),
                          SizedBox(width: 23,),
                          InkWell(onTap: (){},child: Image.asset("assets/logo/facebook.png",height: 25,width: 25,)),
                          SizedBox(height: 8,),
                        ],
                      ),
                      SizedBox(height: 17,),
                      RichText(text: TextSpan(text: "Don't have an account? ",style: TextStyle(color: Color(0xFF4E646C)),children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseAccountType())),
                            text: "Sign Up",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)
                        )
                      ])),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

