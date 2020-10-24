import 'package:mobx/mobx.dart';

part 'infoFormStateManagement.g.dart';

class formStatesClass = formStates with _$formStatesClass;

abstract class formStates with Store{

  @observable
  bool male = true;

  @observable
  bool spinner = false;

  @action
  change_gender(){
    male = !male;
  }

  @action
  showSpinner(){
    spinner = !spinner;
  }

}