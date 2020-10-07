import '../../../Constants.dart';
import '../../../Screens/homeScreens/doctorAppointment/primary_care_doctor_types.dart';
import '../../../Screens/homeScreens/doctorAppointment/specialty_care_doctor_types.dart';
import 'package:flutter/cupertino.dart';
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
      color: Color(0xfff0f0f0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 22.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Find a doctor suitable to your needs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: primaryDark,
                      fontSize: 25
                    ),
                ),
              ),
              doctorType(img: 'assets/images/primary_doctor.jpg',title: 'Primary Care Doctors',desc: primaryCareDoctorDefinition, func: (){
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) => new primary_care_doctor_types(),
                );
                Navigator.of(context).push(route);
              }),
              doctorType(img: 'assets/images/specialty_doctors.png',title: 'Specialty doctors',desc: specialtyDoctorDefinition, func: (){
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) => new specialty_care_doctor_types(),
                );
                Navigator.of(context).push(route);
              }),
            ],
          ),
        ),
      ),
    );
  }
}



class doctorType extends StatelessWidget {

  final String img;
  final String title;
  final String desc;
  final VoidCallback func;

  const doctorType({
    Key key, this.img, this.title, this.desc, this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                width: 400,
                image: AssetImage(img),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 18),
              child: Container(
                width: 400,
                child: Text(desc,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700
                    ),
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            InkWell(
              onTap: func,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
                  color: primaryDark,
                ),
                child: Center(
                  child: Text(
                    'See Doctors',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
