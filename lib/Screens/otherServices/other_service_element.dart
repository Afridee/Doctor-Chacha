import '../../Constants.dart';
import '../../Screens/medicineReminder/toDo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class other_service_element extends StatelessWidget {

  final IconData icon;
  final String title;

  const other_service_element({
    Key key, this.icon, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        var route = new MaterialPageRoute(
          builder: (BuildContext context) => new toDo(),
        );
        Navigator.of(context).push(route);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, size: 40, color: primaryDark),
            SizedBox(
              height: 10,
            ),
            Container(width: 90,child: Text(title, textAlign: TextAlign.center))
          ],
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}