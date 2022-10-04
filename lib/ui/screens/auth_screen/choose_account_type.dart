import 'package:driveu/ui/screens/auth_screen/driver_signup_screen.dart';
import 'package:driveu/ui/screens/auth_screen/user_signup_screen.dart';
import 'package:driveu/ui/widgets/mid_text.dart';
import 'package:driveu/ui/widgets/my_button.dart';
import 'package:flutter/material.dart';

class ChooseAccountType extends StatefulWidget {
  const ChooseAccountType({Key? key}) : super(key: key);

  @override
  State<ChooseAccountType> createState() => _ChooseAccountTypeState();
}

class _ChooseAccountTypeState extends State<ChooseAccountType> {
  bool driverSelected = false;
  bool userSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MidText(text: "Choose Account Type", size: 24),
            SizedBox(height: 50,),
            Row(
              children: [
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          driverSelected = true;
                          userSelected = false;
                        });
                      },
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width*0.40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF282E37)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/driver.png",height: 88,),
                            SizedBox(height: 7,),
                            Text("I am a driver",style: TextStyle(fontSize: 20,color: driverSelected == true ? Colors.blue : Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    if(driverSelected)
                    Positioned(right: 0,child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.check_circle,color: Colors.blue,),
                    ))
                  ],
                ),
                SizedBox(width: 20,),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          userSelected = true;
                          driverSelected = false;
                        });
                      },
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width*0.40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF282E37)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/image38.png",height: 88,),
                            SizedBox(height: 7,),
                            Text("I need driver",style: TextStyle(fontSize: 20,color: userSelected == true ? Colors.blue : Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    if(userSelected)
                    Positioned(right: 0,child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.check_circle,color: Colors.blue,),
                    ))
                  ],
                ),

              ],
            ),
            SizedBox(height: 180,),
            Center(child: MyButton(text: "Continue", function: (){
              if(driverSelected == false && userSelected == false){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Choose a type first")));
              }
              if(!driverSelected == false || !userSelected == false){
                if(driverSelected == true){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverSignupScreen()));
                }
                if(userSelected == true){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserSignupScreen()));
                }
              }
            }))
          ],
        ),
      ),
    );
  }
}
