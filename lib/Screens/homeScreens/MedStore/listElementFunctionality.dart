import '../../../models/productModel.dart';
import '../../../widgets/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Constants.dart';
import 'package:hive/hive.dart';

void addToCart({BuildContext context,ProductModel productModel, int qty}) async{

  try{
    Box<Map> cartBox = Hive.box<Map>("cart");

    if(qty>0){
      cartBox.put(
        productModel.toJson()['brandName'],
        { 'qty': qty,
          'productDetails' : productModel.toJson()
        },
      );
    }

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