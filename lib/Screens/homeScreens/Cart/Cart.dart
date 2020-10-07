import 'cartList.dart';
import 'confirmPart.dart';
import 'couponPart.dart';
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
      decoration: BoxDecoration(
        color: Color(0xfff0f0f0),
      ),
      child: Column(
        children: [
          Expanded(child: couponPart(), flex: 1),
          Expanded(
              child: CartList(),
              flex: 6),
          Expanded(child: confirmPart(), flex: 1)
        ],
      ),
    );
  }
}

