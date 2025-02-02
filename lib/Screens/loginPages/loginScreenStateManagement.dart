import 'dart:async';
import 'package:mobx/mobx.dart';

part 'loginScreenStateManagement.g.dart';

class loginScreenStateClass = loginScreenState with _$loginScreenStateClass;

abstract class loginScreenState with Store{

  @observable
  bool Spinner = false;

  @action
  void setSpinner() {
    Timer(Duration(seconds: 10),(){
      Spinner = !Spinner;
    });
    Spinner = !Spinner;
  }
}