import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DataModel {
  // Future uploadImage(File file,String name,String imgUrl)async{
  //   UploadTask uploadTask = FirebaseStorage.instance.ref("images").child(name).putFile(file);
  //   TaskSnapshot snap = await uploadTask;
  //   imgUrl = await snap.ref.getDownloadURL();
  //
  //
  // }
  Future writeData(
      String first_name,
      String last_name,
      String phone,
      String email,
      String password,
      String address,
      String city,
      String driverType,
      String expYear,
      DateTime dateTime,
      String pp,
      String dlImg,
      String card1Img,
      String card2Img
      )async{
    await FirebaseFirestore.instance.collection("driver").add({
      "first_name": first_name,
      "last_name": last_name,
      "phone":phone,
      "email": email,
      "password": password,
      "address" : address,
      "city": city,
      "driverType": driverType,
      "expYear": expYear,
      "dateTime": dateTime,
      "pp": pp,
      "dlImg": dlImg,
      "card1Img": card1Img,
      "card2Img": card2Img,
    });
  }
}