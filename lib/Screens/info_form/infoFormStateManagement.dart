import 'package:mobx/mobx.dart';

class formStates{

  Observable male = Observable(true);
  Observable spinner = Observable(false);
  
  Action change_gender;
  Action showSpinner;

  formStates(){

    change_gender = Action((){
       male.value = !male.value;
    });

    showSpinner = Action((){
      spinner.value = !spinner.value;
    });

  }

}