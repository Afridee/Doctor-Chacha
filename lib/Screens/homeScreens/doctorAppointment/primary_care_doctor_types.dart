import '../../../Constants.dart';
import '../../../Screens/homeScreens/doctorAppointment/subTypeDoctorElement.dart';
import 'package:flutter/material.dart';

class primary_care_doctor_types extends StatefulWidget {
  @override
  _primary_care_doctor_typesState createState() =>
      _primary_care_doctor_typesState();
}

class _primary_care_doctor_typesState extends State<primary_care_doctor_types> {
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
          children: [
            subTypeDoctorElement(
              title: 'Family practice physician',
              subtitle: familtPracticePhycisianDefinition,
              img: 'assets/images/Family_practice_physician-01.png',
            ),
            subTypeDoctorElement(
              title: 'Internal Medicine Physician',
              subtitle: InternalMedicinePhysicianDefinition,
              img: 'assets/images/Internal_medicine_physician.png',
            ),
            subTypeDoctorElement(
              title: 'Geriatric medicine doctors',
              subtitle: GeriatricMedicineDoctorsDefinition,
              img: 'assets/images/Geriatric_medicine_doctors-01.png',
            ),
            subTypeDoctorElement(
              title: 'Pediatricians',
              subtitle: PediatriciansDefinition,
              img: 'assets/images/Pediatricians-01.png',
            )
          ],
        ),
      ),
    );
  }
}
