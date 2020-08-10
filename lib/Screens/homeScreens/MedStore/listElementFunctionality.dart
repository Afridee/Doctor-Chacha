import 'package:doctor_chacha/widgets/snackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctor_chacha/Constants.dart';

void addToCart({BuildContext context, String brandName, String manufacturer, String strength, double price, String unit, int qty}) async{

  try{
    final auth = FirebaseAuth.instance;
    final FirebaseUser user = await auth.currentUser();
    String userID = user.uid;

    final CollectionReference cart = Firestore.instance.collection('users/${userID}/cart');

   await cart.document(brandName).setData({
      'brandName' : brandName,
      'manufacturer' : manufacturer,
      'strength' : strength,
      'price' : price,
      'unit' : unit,
      'qty' : qty
    }, merge: true);

    snackBar(
        duration: 2,
        context: context,
        text: 'Added to Cart',
        trailingIcon: FaIcon(
          FontAwesomeIcons.shoppingCart,
          color: primaryDark,
          size: 20,
        ),
        textColor: primaryDark,
        bgColor: primaryLight
    );

  }catch(e){
    snackBar(
        duration: 2,
        context: context,
        text: 'Error',
        trailingIcon: FaIcon(
          FontAwesomeIcons.cross,
          color: Colors.white,
          size: 20,
        ),
        textColor: Colors.white,
        bgColor: Colors.red
    );
  }

}