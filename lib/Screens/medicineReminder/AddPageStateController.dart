import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'addReminder.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'dart:math' as Dmath;
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class AddPageStatecontroller extends GetxController{

  List<TimeOfDay> selectedTimes = new List<TimeOfDay>();
  bool toggleReminder = false;
  List<DateTime> dateList = new List<DateTime>();

  Map<String, bool> weekdays = {
    'Saturday' : true,
    'Sunday' : true,
    'Monday' : true,
    'Tuesday' : true,
    'Wednesday' : true,
    'Thursday' : true,
    'Friday' : true,
  };

  void removeFromSelectedTimes(int i){
    selectedTimes.removeAt(i);
    update();
  }

  void toggleWeekday(String day){
    weekdays[day] = !weekdays[day];
    update();
    print(weekdays);
  }

  void toggleButton_for_reminder() {
      toggleReminder = !toggleReminder;
      update();
  }


  onDone(BuildContext context, String title, String description) {
    try {
      Box<Map> todoBox = Hive.box<Map>("todoBox");

      DateTime temp = dateList.first;

      while (!temp.isAfter(dateList.last)) {

        selectedTimes.forEach((selectedtime) {
          //selects date:
          DateTime selectedDate = new DateTime(
              temp.year,
              temp.month,
              temp.day,
              selectedtime.hour,
              selectedtime.minute,
              temp.second,
              temp.millisecond,
              temp.microsecond);

          if(weekdays[ DateFormat('EEEE').format(selectedDate).toString()]){

            //generate random ID for notification:
            var rng = new Dmath.Random();
            int generatedID = rng.nextInt(100);

            //puts in hive box:
            todoBox.put(
              DateFormat('yyyy-MM-dd HH:mm:ss').format(selectedDate),
              {
                'notificationId': generatedID,
                'title': title,
                'description': description,
                'time': DateFormat('yyyy-MM-dd HH:mm:ss').format(selectedDate),
                'reminder': toggleReminder
              },
            );

            //if reminder is turned on, sets reminder
            if (toggleReminder) {
              scheduleAlarm(selectedDate, generatedID, title,
                  description);
            }
          }
        });

        //adds selectedDate+1:
        temp = temp.add(Duration(days: 1));
      }

      Navigator.of(context).pop();
    } catch (e) {
      print(e);
    }
  }

  setDateList(BuildContext context) async {
    dateList = await DateRangePicker.showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialFirstDate: DateTime.now(),
      initialLastDate: DateTime.now().add(Duration(days: 5)),
      initialDatePickerMode: DateRangePicker.DatePickerMode.day,
    );
    update();
  }

  selectTime(BuildContext context) async {
    TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if(selectedTime!=null){
      selectedTimes.add(selectedTime);
      update();
    }
  }

}