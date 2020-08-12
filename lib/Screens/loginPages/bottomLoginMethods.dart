
import 'package:doctor_chacha/Screens/loginPages/enterPhoneNumberScreen.dart';
import 'package:doctor_chacha/Screens/loginPages/loginFunctionalities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class bottomLoginMethods extends StatefulWidget {
  const bottomLoginMethods({
    Key key,
  }) : super(key: key);

  @override
  _bottomLoginMethodsState createState() => _bottomLoginMethodsState();
}

class _bottomLoginMethodsState extends State<bottomLoginMethods> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.facebook),
              color: Colors.blueAccent,
              iconSize: 40,
              onPressed: () async {
                LogInWithFacebook(context);
              },
            ),
            Text('Facebook')
          ],
        ),
        SizedBox(width: 20),
        Column(
          children: [
            IconButton(
                icon: FaIcon(FontAwesomeIcons.google),
                color: Colors.red,
                iconSize: 40,
                onPressed: () async {
                  LogInWIthGoogle(context);
                }),
            Text('Google')
          ],
        ),
        SizedBox(width: 20),
        Column(
          children: [
            IconButton(
                icon: FaIcon(FontAwesomeIcons.mobile),
                color: Colors.green,
                iconSize: 40,
                onPressed: () {
                  var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new enterPhoneNumber(),
                  );
                  Navigator.of(context).push(route);
                }),
            Text('Phone')
          ],
        )
      ],
    );
  }
}