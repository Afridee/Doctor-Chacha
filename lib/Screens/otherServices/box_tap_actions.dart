import '../medicineReminder/toDo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

go_to_medicineReminder(BuildContext context){
  var route = new MaterialPageRoute(
    builder: (BuildContext context) => new toDo(),
  );
  Navigator.of(context).push(route);
}