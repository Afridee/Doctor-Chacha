import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
         children: [
           Expanded(child: Container(
             color: Colors.green
           ),flex: 1),
           Expanded(child: Container(
               color: Colors.red
           ),flex: 5),
           Expanded(child: Container(
               color: Colors.purple
           ),flex: 1)
         ],
      ),
    );
  }
}

