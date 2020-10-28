import 'package:doctor_chacha/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AddPageStateController.dart';


class time_element extends StatelessWidget {

  final int index;

  AddPageStatecontroller aPController = Get.put(AddPageStatecontroller());

  time_element({
    Key key,@required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPageStatecontroller>(
        builder: (_AddPageState) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    _AddPageState.selectedTimes[index].toString().replaceAll('TimeOfDay', '').replaceAll('(', '').replaceAll(')', ''),
                    style: TextStyle(fontSize: 20, color: primaryDark),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  InkWell(child: Icon(Icons.cancel, size: 30,color: primaryDark,),onTap: (){
                    aPController.removeFromSelectedTimes(index);
                  },)
                ],
              ),
            ),
          );
        });
  }
}