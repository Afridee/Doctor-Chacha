import '../../Constants.dart';
import 'service_boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class OtherServices extends StatefulWidget {
  @override
  _OtherServicesState createState() => _OtherServicesState();
}

class _OtherServicesState extends State<OtherServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.arrow_back), color: primaryDark, onPressed: (){
                  Navigator.of(context).pop();
                }),
                Text(
                  'Other services',
                  style: TextStyle(
                      color: primaryDark,
                      fontSize: 28,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          service_boxes()
        ],
      ),
    );
  }
}




