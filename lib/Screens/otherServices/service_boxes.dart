import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'other_service_element.dart';

class service_boxes extends StatelessWidget {
  const service_boxes({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-100,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              other_service_element(icon: Icons.calculate, title: 'BMI Calculator'),
              other_service_element(icon: Icons.notifications_active, title: 'Medicine reminder'),
            ],
          ),
        ],
      ),
    );
  }
}