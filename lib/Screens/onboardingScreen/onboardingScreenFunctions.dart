import  'package:doctor_chacha/Screens/Home.dart';
import 'package:doctor_chacha/Screens/info_form/info_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

bool userInfoexists;

initialize_userInfoexists() async{
  final auth = FirebaseAuth.instance;
  final FirebaseUser user = await auth.currentUser();
  String userID = user.uid;

  await Firestore.instance.document('users/${userID}').get().then((onexist) {
    onexist.exists ? userInfoexists = true : userInfoexists = false;
  });

}

//Page After Onboarding Screen:
afterOnboardingScreens(BuildContext context) async {
  if(!userInfoexists){
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => new infoForm(),
    );
    Navigator.of(context).push(route);
  }else{
    var route = new MaterialPageRoute(
      builder: (BuildContext context) => new Home(),
    );
    Navigator.of(context).push(route);
  }
}