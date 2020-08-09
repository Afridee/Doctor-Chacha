import 'package:mobx/mobx.dart';

class listItemState{

  Observable qty = Observable(0);

  Action add;
  Action deduct;

  listItemState(){

    add = Action((){
      qty.value++;
    });

    deduct = Action((){
      if(qty.value>0){
        qty.value--;
      }
    });

  }

}