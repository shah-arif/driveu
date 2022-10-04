import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driveu/ui/widgets/mid_text.dart';
import 'package:driveu/ui/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class LtvDrivers extends StatelessWidget {
  const LtvDrivers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("LTV Drivers"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications,size: 25,)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10,),
            MyTextField(hintText: "Search LTV Drivers",widget: Icon(Icons.search,color: Colors.white,)),
            SizedBox(height: 10,),
            Expanded(child:
            StreamBuilder(
                stream: FirebaseFirestore.instance.collection("driver").where("driverType",isEqualTo: "LTV").snapshots(),
                builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              if(snapshot.hasError){
                return Text("Something Went Wrong");
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    return Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(radius: 40,backgroundImage: NetworkImage(snapshot.data!.docs[index]["pp"]),),
                                SizedBox(width: 40,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MidText(text: snapshot.data!.docs[index]["first_name"]+" "+snapshot.data!.docs[index]["last_name"], size: 17,fontWeight: FontWeight.w500,),
                                    MidText(text: snapshot.data!.docs[index]["address"], size: 12,fontWeight: FontWeight.w400,),
                                    Row(
                                      children: [
                                        Image.asset("assets/images/ltvlogo.png",height: 40 ,width: 40,),
                                        MidText(text: snapshot.data!.docs[index]["expYear"]+" years of experience", size: 14,fontWeight: FontWeight.w400,)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 13,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_alt_outlined),),
                                        MidText(text: "15", size: 14,fontWeight: FontWeight.w500,)
                                      ],
                                    ),
                                    SizedBox(width: 8,),
                                    Row(
                                      children: [
                                        IconButton(onPressed: (){}, icon: Icon(Icons.chat_outlined),),
                                        MidText(text: "4", size: 14,fontWeight: FontWeight.w500,)
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 50,),
                                Row(
                                  children: [
                                    IconButton(onPressed: (){} , icon: Icon(Icons.chat_bubble_outline),),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.call),)
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            })
            )
          ],
        ),
      ),
    );
  }
}
