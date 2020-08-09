import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

bool search(BuildContext context,String searchQuery,String existingItem){

  var sQList = searchQuery.split(' ');

  for(int i=0;i<sQList.length;i++){
    if(existingItem.trim().toLowerCase().contains(sQList[i].toLowerCase().trim())){
      return true;
    }
  }

  return false;

}