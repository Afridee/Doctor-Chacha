import 'package:date_time_format/date_time_format.dart';
import 'package:doctor_chacha/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TodoModel.dart';

class listElement extends StatelessWidget {
  final TodoModel toDo;

  const listElement({
    Key key,
    this.toDo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
              ],
            )),
        child: ListTile(
          title: Text(
            toDo.title,
            style: TextStyle(
                color: primaryDark, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            toDo.description +
                '\nat ' +
                DateTime.parse(toDo.time)
                    .format(DateTimeFormats.american)
                    .split(' ')[DateTime.parse(toDo.time)
                        .format(DateTimeFormats.american)
                        .split(' ')
                        .length -
                    2] +
                ' ' +
                DateTime.parse(toDo.time)
                    .format(DateTimeFormats.american)
                    .split(' ')
                    .last,
            style: TextStyle(color: primaryDark),
          ),
          trailing: toDo.reminder
              ? IconButton(
                  icon: Icon(Icons.notifications_active, color: primaryDark),
                  onPressed: () {
                    print(toDo.toJson());
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.notifications_off,
                    color: primaryDark,
                  ),
                  onPressed: () {
                    print(toDo.toJson());
                  },
                ),
        ),
      ),
    );
  }
}
