import 'package:flutter/material.dart';

class doctorAppointment extends StatefulWidget {
  @override
  _doctorAppointmentState createState() => _doctorAppointmentState();
}

class _doctorAppointmentState extends State<doctorAppointment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(0xffF0F0F0),
      child: Center(
        child: Text(
          'doctor Appointment'
        ),
      )
    );
  }
}
