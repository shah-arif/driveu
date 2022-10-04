import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:driveu/bloc/data_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../../bloc/auth/auth_user.dart';
import '../../widgets/mid_text.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text_field.dart';
import 'login_screen.dart';

class DriverSignupScreen extends StatefulWidget {
  const DriverSignupScreen({Key? key}) : super(key: key);

  @override
  State<DriverSignupScreen> createState() => _DriverSignupScreenState();
}
  List<String> list = <String>['LTV', 'HTV',];
  String dropdownValue = list.first;

class _DriverSignupScreenState extends State<DriverSignupScreen> {
  final TextEditingController _fistNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  String imgName = "";
  File? profilePic;
  File? dLPic;
  File? card1Pic;
  File? card2Pic;
  String? imgUrl;





  Future getProfilePic()async{
    try {
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery,imageQuality: 20);

      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.profilePic = imageTemp;
        imgName = image.name;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
      // MySnack().showSnack(context, Text("Failed to pick image"));
    }
  }
  Future writeData()async{
    FirebaseStorage storage = FirebaseStorage.instance;
    UploadTask task = storage.ref("images").child(imgName).putFile(profilePic!);
    TaskSnapshot snap = await task;
    imgUrl = await snap.ref.getDownloadURL();

    FirebaseFirestore.instance.collection("driver").add({
      "first_name": _fistNameController.text,
      "last_name": _lastNameController.text,
      "phone":_phoneController.text,
      "email": _emailController.text,
      "password": _phoneController.text,
      "address" : _addressController.text,
      "city": _cityController.text,
      "driverType": dropdownValue,
      "expYear": _experienceController.text,
      "dateTime": Timestamp.now(),
      "pp": imgUrl,
      "dlImg": "dlImg",
      "card1Img": "card1Img",
      "card2Img": "card2Img",
    });

  }
  Future getdLPic()async{
    try {
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery);

      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.dLPic = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
      // MySnack().showSnack(context, Text("Failed to pick image"));
    }
  }
  Future getCard1Pic()async{
    try {
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery);

      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.card1Pic = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
      // MySnack().showSnack(context, Text("Failed to pick image"));
    }
  }
  Future getCard2Pic()async{
    try {
      final ImagePicker _picker = ImagePicker();
      final image = await _picker.pickImage(source: ImageSource.gallery);

      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.card2Pic = imageTemp;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
      // MySnack().showSnack(context, Text("Failed to pick image"));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
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
                Center(
                  child: Column(
                    children: [
                      MidText(text: "Profile Picture", size: 16),
                      const SizedBox(height: 16,),
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
                SizedBox(height: 45,),
                MidText(text: "First Name *", size: 15),
                SizedBox(height: 8,),
                MyTextField(hintText: "Jason",textInputType: TextInputType.name,
                    controller: _fistNameController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Input Fist Name";
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
                MidText(text: "Phone *", size: 15),
                SizedBox(height: 8,),
                MyTextField(hintText: "018137471759",textInputType: TextInputType.phone,
                    controller: _phoneController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Input email or phone";
                      }
                      return null;
                    }
                ),
                SizedBox(height: 8,),
                MidText(text: "Email *", size: 15),
                SizedBox(height: 8,),
                MyTextField(hintText: "jasonsmith@gmail.com",textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Input email or phone";
                      }
                      return null;
                    }
                ),
                SizedBox(height: 8,),
                MidText(text: "Password *", size: 15),
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
                MidText(text: "Complete Address *", size: 15,),
                SizedBox(height: 8,),
                MyTextField(hintText: "Eg: 25/2 Bloc A, Lahore, PK",textInputType: TextInputType.streetAddress,
                    controller: _addressController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Input Address";
                      }
                      return null;
                    }
                ),
                SizedBox(height: 8,),
                MidText(text: "City *", size: 15,),
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
                SizedBox(height: 8,),
                MidText(text: "Select Driver type *", size: 15),
                SizedBox(height: 8,),
                Container(
                  height: 54,
                  decoration: BoxDecoration(
                      color: Color(0xFF282E37),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValue,
                        style: TextStyle(color: Colors.white),
                        icon: const Icon(Icons.arrow_drop_down,size: 40),
                        // iconEnabledColor: Colors.white,
                        elevation: 16,
                        //   underline: Container(
                        //     width: 200,
                        //   height: 1,
                        //   color: Colors.white,
                        // ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        selectedItemBuilder: (BuildContext context){
                          return list.map((value) {
                            return DropdownMenuItem(child: Text(value,style: TextStyle(color: Colors.white)),value: value,);
                          }).toList();
                        },
                        dropdownColor: Color(0xFF3C495E),
                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: TextStyle(color: Colors.white),),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                MidText(text: "Duration of experience (Years)", size: 15),
                SizedBox(height: 8,),
                MyTextField(hintText: "1 years of experience",textInputType: TextInputType.number,maxLength: 2,
                    controller: _experienceController,
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Input years of experience";
                      }
                      return null;
                    }
                ),
                SizedBox(height: 8,),
                MidText(text: "Upload picture of driving licence *", size: 16),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: DottedBorder(
                    dashPattern: [10, 10],
                    strokeWidth: 3,
                    color: Color(0xFFBEBEBE),
                    child: InkWell(
                      onTap: (){
                        getdLPic();
                      },
                      child: dLPic != null ? Container(
                        height: 136,
                        width: 115,
                        child: Image.file(dLPic!,
                          fit: BoxFit.cover,
                        ),
                      ) : Container(
                        height: 136,
                        width: 115,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_upload,color: Colors.blue,size: 45,),
                            MidText(text: "Choose a file", size: 14,),
                            MidText(text: "Click here to upload", size: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                MidText(text: "Upload card picture double sided *", size: 16),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: DottedBorder(
                        dashPattern: [10, 10],
                        strokeWidth: 3,
                        color: Color(0xFFBEBEBE),
                        child: InkWell(
                          onTap: (){
                            getCard1Pic();
                          },
                          child: card1Pic != null ? Container(
                            height: 136,
                            width: 115,
                            child: Image.file(card1Pic!,
                              fit: BoxFit.cover,
                            ),
                          ) : Container(
                            height: 136,
                            width: 115,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud_upload,color: Colors.blue,size: 45,),
                                MidText(text: "Choose a file", size: 14,),
                                MidText(text: "Click here to upload", size: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16,),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: DottedBorder(
                        dashPattern: [10, 10],
                        strokeWidth: 3,
                        color: Color(0xFFBEBEBE),
                        child: InkWell(
                          onTap: (){
                            getCard2Pic();
                          },
                          child: card2Pic != null ? Container(
                            height: 136,
                            width: 115,
                            child: Image.file(card2Pic!,
                              fit: BoxFit.cover,
                            ),
                          ) : Container(
                            height: 136,
                            width: 115,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.cloud_upload,color: Colors.blue,size: 45,),
                                MidText(text: "Choose a file", size: 14,),
                                MidText(text: "Click here to upload", size: 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24,),
                Center(child: MyButton(text: "Register", function: (){
                  if(_formKey.currentState!.validate()){
                    AuthUser().createUserAccount(_emailController.text, _passwordController.text,context);
                    writeData();
                    // DataModel().writeData(_fistNameController.text, _lastNameController.text, _phoneController.text, _emailController.text, _passwordController.text, _addressController.text, _cityController.text, dropdownValue, _experienceController.text, DateTime.now(), imgUrl!, "dlImg", "card1Img", "card2Img");

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
