import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginTextfield extends StatelessWidget {

  final String hintText;
  final bool hideText;

  const loginTextfield({
    Key key,@required this.hintText,@required this.hideText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.grey[100]))),
      child: TextField(
        obscureText: hideText,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {

        },
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: hintText,
            hintStyle: TextStyle(
                color: Colors.grey[400])),
      ),
    );
  }
}