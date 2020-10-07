import '../../Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


Done(BuildContext context, String first_name, String last_name, String phoneNumber, String address, bool male) async{

  final auth = FirebaseAuth.instance;
  final User user = auth.currentUser;
  String userID = user.uid;

    if(first_name.length>0 &&
       last_name.length>0 &&
       phoneNumber.length>0 &&
       address.length>0){

       final CollectionReference users = FirebaseFirestore.instance.collection('users');

       await users.doc(userID).set({
         'first_name' : first_name,
         'last_name' : last_name,
         'phone_number' : phoneNumber,
         'address' : address,
         'male' : male
       },);

       var route = new MaterialPageRoute(
         builder: (BuildContext context) => new Home(),
       );
       Navigator.of(context).push(route);

    }
}