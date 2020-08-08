import 'package:doctor_chacha/Screens/homeScreens/MedStore/theListPart.dart';
import 'package:doctor_chacha/Screens/homeScreens/MedStore/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class medicineStore extends StatefulWidget {
  @override
  _medicineStoreState createState() => _medicineStoreState();
}

class _medicineStoreState extends State<medicineStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: searchBar(),
              flex: 1,
            ),
            Expanded(
              child: theListPart(),
              flex: 8,
            )
          ],
        ));
  }
}



