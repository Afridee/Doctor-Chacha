import 'package:doctor_chacha/Screens/homeScreens/MedStore/listElement.dart';
import 'package:flutter/material.dart';

class theListPart extends StatelessWidget {
  const theListPart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff0f0f0),
      child: ListView(
        children: <Widget>[
          listElement()
        ],
      ),
    );
  }
}

