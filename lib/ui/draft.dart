import 'package:driveu/ui/widgets/my_button.dart';
import 'package:flutter/material.dart';

class Draft extends StatefulWidget {
  const Draft({Key? key}) : super(key: key);

  @override
  State<Draft> createState() => _DraftState();
}

class _DraftState extends State<Draft> {
  Color? color;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(color: color,),
              Container(
                height: 54,
                color: Colors.red,
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Color(0xFF282E37),
                      filled: true

                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Fill the Field";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 30,),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 15,bottom: 15,left: 15,right: 15),
                  suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye,size: 20,)),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    // focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Color(0xFF282E37),
                    filled: true

                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Fill the Field";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30,),
              MyButton(text: "Submit", function: (){
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("okay")));
                }
                setState(() {

                });
              })
            ],
          ),
        ),
      ),
    );
  }
}
