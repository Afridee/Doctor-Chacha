import 'package:flutter/material.dart';
import 'package:doctor_chacha/Constants.dart';
import 'package:doctor_chacha/Screens/homeScreens/doctorAppointment/subTypeDoctorElement.dart';


class doctorList extends StatefulWidget {
  @override
  _doctorListState createState() =>
      _doctorListState();
}

class _doctorListState extends State<doctorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose a primary care doctor type',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              primaryLight,
              primaryDark,
            ]),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(

        ),
      ),
    );
  }
}
