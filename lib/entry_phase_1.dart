import 'package:doctor_chacha/Screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Services/firebase_auth_service.dart';
import 'file:///F:/Doctor_chscha/doctor_chacha/lib/Screens/onboardingScreen/onboarding_screens.dart';

class entry_phase_1 extends StatefulWidget {
  @override
  _entry_phase_1State createState() => _entry_phase_1State();
}

class _entry_phase_1State extends State<entry_phase_1> {
  @override
  Widget build(BuildContext context) {
    final auth  = Provider.of<FirebaseAuthService>(context, listen: false);
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (_, AsyncSnapshot<User> snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          final User user = snapshot.data;
          return user == null? login_page() : onboarding_Screen_slider();
        }else{
          return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              )
          );
        }
      },
    );
  }
}