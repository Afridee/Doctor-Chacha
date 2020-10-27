import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AddPageStateController.dart';



class WeekDayElementAddPage extends StatelessWidget {
  final String weekday;
  AddPageStatecontroller aPController = Get.put(AddPageStatecontroller());

  WeekDayElementAddPage({Key key, this.weekday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPageStatecontroller>(builder: (context) {
      return Container(
        padding: EdgeInsets.all(1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weekday),
            Checkbox(
              value: context.weekdays[weekday],
              onChanged: (value) {
                context.toggleWeekday(weekday);
              },
            ),
          ],
        ),
      );
    });
  }
}