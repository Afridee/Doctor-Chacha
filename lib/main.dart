import 'package:doctor_chacha/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Services/firebase_auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<FirebaseAuthService>(
        create: (context) => FirebaseAuthService(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: login_page(),
        )
    );
  }
}
