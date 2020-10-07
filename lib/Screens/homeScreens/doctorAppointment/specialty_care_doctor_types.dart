import '../../../Constants.dart';
import '../../../Screens/homeScreens/doctorAppointment/subTypeDoctorElement.dart';
import 'package:flutter/material.dart';

class specialty_care_doctor_types extends StatefulWidget {
  @override
  _specialty_care_doctor_typesState createState() =>
      _specialty_care_doctor_typesState();
}

class _specialty_care_doctor_typesState extends State<specialty_care_doctor_types> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Choose a Specialty doctor type',
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
              title: 'Allergists',
              subtitle: AllergistDefinition,
              img: 'assets/images/Allergists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Cardiologists',
              subtitle: CardiologistsDefinition,
              img: 'assets/images/Cardiologists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Dentists',
              subtitle: DentistsDefinition,
              img: 'assets/images/Dentists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Dermatologists',
              subtitle: DermatologistsDefinition,
              img: 'assets/images/Dermatologists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Endocrinologists',
              subtitle: EndocrinologistsDefinition,
              img: 'assets/images/Endocrinologists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Gynecologists',
              subtitle: GynecologistsDefinition,
              img: 'assets/images/gynecologists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Infectious disease doctors',
              subtitle: infectousDiseaseDoctorsDefinition,
              img: 'assets/images/Infectious_disease_doctors-01.png',
            ),
            subTypeDoctorElement(
              title: 'Nephrologists',
              subtitle: NephrologistsDefinition,
              img: 'assets/images/Nephrologists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Neurologists',
              subtitle: NeurologistsDefinition,
              img: 'assets/images/Neurologists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Oncologists',
              subtitle: OncologistsDefinition,
              img: 'assets/images/Oncologists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Ophthalmologists',
              subtitle: OphthalmologistsDefinition,
              img: 'assets/images/Ophthalmologists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Otolaryngologists',
              subtitle: OtolaryngologistsDefinition,
              img: 'assets/images/Otolaryngologists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Psychiatrists',
              subtitle: PsychiatristsDefinition,
              img: 'assets/images/Psychiatrists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Pulmonologists',
              subtitle: PulmonologistsDefinition,
              img: 'assets/images/Pulmonologists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Rheumatologists',
              subtitle: RheumatologistsDefinition,
              img: 'assets/images/Rheumatologists-01.png',
            ),
            subTypeDoctorElement(
              title: 'Urologists',
              subtitle: UrologistsDefinition,
              img: 'assets/images/Urologists-01.png',
            ),
          ],
        ),
      ),
    );
  }
}
