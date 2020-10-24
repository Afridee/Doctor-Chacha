import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../Screens/loginPages/firebase_auth_service.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../../../Constants.dart';
import 'package:flutter/material.dart';

import 'cartStateManagement.dart';

class confirmPart extends StatefulWidget {

  final cartStateClass CS;

  const confirmPart({
    Key key,@required this.CS,
  }) : super(key: key);

  @override
  _confirmPartState createState() => _confirmPartState();
}

class _confirmPartState extends State<confirmPart> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        final auth  = Provider.of<FirebaseAuthService>(context, listen: false);
        Box<Map> cartBox;
        cartBox = Hive.box<Map>("cart");



        final CollectionReference orders = FirebaseFirestore.instance.collection('users/${auth.userID}/orders');

        orders.doc().set({
          'orderType' : 'meds',
          'prducts' : cartBox.toMap(),
          'totalCost' : widget.CS.totalCost
        });

      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff0f0f0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: 8.0, top: 8.0, left: 120, right: 120),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: primaryLight,
                  width: 2
                ),
              gradient: LinearGradient(
                  colors: [
                    primaryDark,
                    primaryDark,
                  ]
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                'Confirm',
                style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}