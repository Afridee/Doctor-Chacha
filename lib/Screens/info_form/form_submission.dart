import 'package:doctor_chacha/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


Done(BuildContext context, String first_name, String last_name, String phoneNumber, String address, bool male) async{

  final auth = FirebaseAuth.instance;
  final FirebaseUser user = await auth.currentUser();
  String userID = user.uid;

    if(first_name.length>0 &&
       last_name.length>0 &&
       phoneNumber.length>0 &&
       address.length>0){

       final CollectionReference users = Firestore.instance.collection('users');

       await users.document(userID).setData({
         'first_name' : first_name,
         'last_name' : last_name,
         'phone_number' : phoneNumber,
         'address' : address,
         'male' : male
       }, merge: true);

       var route = new MaterialPageRoute(
         builder: (BuildContext context) => new Home(),
       );
       Navigator.of(context).push(route);

    }
}