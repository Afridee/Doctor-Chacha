import 'package:doctor_chacha/Services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Future<void> LogInWithFacebook(BuildContext context) async {
  final auth = Provider.of<FirebaseAuthService>(context, listen: false);
  final user = await auth.fbLogin();
}

Future<void> LogInWIthGoogle(BuildContext context) async {
  final auth = Provider.of<FirebaseAuthService>(context, listen: false);
  final user = await auth.googleLogin();
}


LogInWithOTP(String smsCode, verID) async{
  final _firebaseAuth = FirebaseAuth.instance;
  AuthCredential authCreds = PhoneAuthProvider.getCredential(verificationId: verID, smsCode: smsCode.trim());
  await _firebaseAuth.signInWithCredential(authCreds);
}

Future<String> LogInWIthPhone(String phoneNumber, BuildContext context) async{
  final auth = Provider.of<FirebaseAuthService>(context, listen: false);
  String verificationID =  await auth.LogInWIthPhone(phoneNumber);
  return verificationID;
}