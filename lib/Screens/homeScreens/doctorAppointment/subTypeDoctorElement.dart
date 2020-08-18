import 'package:doctor_chacha/Constants.dart';
import 'package:doctor_chacha/Screens/homeScreens/doctorAppointment/doctorList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class subTypeDoctorElement extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;

  const subTypeDoctorElement({
    Key key,
    this.title,
    this.subtitle,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
            primaryLight,
            primaryDark,
          ]),
        ),
        child: ListTile(
          leading: Image(image: AssetImage(img), color: primaryDark),
          title: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700
          )),
          subtitle: Text(subtitle,
              style: TextStyle(color: Colors.white, fontSize: 10)),
          trailing: IconButton(
            icon: Icon(Icons.list),
            color: primaryLight,
            onPressed: () {
              var route = new MaterialPageRoute(
                builder: (BuildContext context) => new doctorList(),
              );
              Navigator.of(context).push(route);
            },
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
