import 'package:mobx/mobx.dart';

part 'homeStateManagement.g.dart';

class homeStateClass = homeState with _$homeStateClass;

abstract class homeState with Store{

  @observable
  String title = 'Medicine Strore';

  @action
  void setTitlse(int i){

    switch(i) {
      case 0: {  title = 'Set Doctor Appointment'; }
      break;

      case 1: {  title = 'Medicine Store'; }
      break;

      case 2: {  title = 'Cart'; }
      break;
    }
  }

}
