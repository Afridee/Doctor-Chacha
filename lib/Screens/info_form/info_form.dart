import '../../Constants.dart';
import '../../Screens/info_form/infoFormStateManagement.dart';
import '../../Screens/loginPages/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../Screens/info_form/formTextfield.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'form_submission.dart';

class infoForm extends StatefulWidget {

  final  String title;

  const infoForm({Key key,@required this.title}) : super(key: key);

  @override
  _infoFormState createState() => _infoFormState();
}

class _infoFormState extends State<infoForm> {
  TextEditingController _firstName;
  TextEditingController _lastName;
  TextEditingController _phoneNumber;
  TextEditingController _Address;
  formStates gS;

  @override
  void initState() {
    gS = new formStates();
    _firstName = new TextEditingController();
    _lastName = new TextEditingController();
    _phoneNumber = new TextEditingController();
    _Address = new TextEditingController();

    final auth = Provider.of<FirebaseAuthService>(context, listen: false);

    if(auth.userInfo!=null){
      _firstName.text = auth.userInfo['first_name'];
      _lastName.text = auth.userInfo['last_name'];
      _phoneNumber.text = auth.userInfo['phone_number'];
      _Address.text = auth.userInfo['address'];
      if(!auth.userInfo['male']){
        gS.change_gender.call();
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _phoneNumber.dispose();
    _Address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      body: Observer(
        builder: (context){
          return ModalProgressHUD(
            inAsyncCall: gS.spinner.value,
            color: primaryDark,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                          Navigator.of(context).pop();
                        }),
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                  ),
                  formTextfield(
                      label: 'First Name',
                      textController: _firstName,
                      inputType: TextInputType.text),
                  formTextfield(
                      label: 'Last Name',
                      textController: _lastName,
                      inputType: TextInputType.text),
                  formTextfield(
                      label: 'Phone Number',
                      textController: _phoneNumber,
                      inputType: TextInputType.number),
                  formTextfield(
                      label: 'Address',
                      textController: _Address,
                      inputType: TextInputType.text),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Gender : ',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text('Male'),
                        Checkbox(
                          value: gS.male.value,
                          onChanged: (value) {
                            gS.change_gender.call();
                          },
                        ),
                        Text('Female'),
                        Checkbox(
                          activeColor: Colors.pink,
                          value: !gS.male.value,
                          onChanged: (value) {
                            gS.change_gender.call();
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      onTap: () async {
                        gS.showSpinner.call();
                        Done(context, _firstName.text, _lastName.text, _phoneNumber.text, _Address.text, gS.male.value);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              primaryLight,
                              primaryDark,
                            ])),
                        child: Center(
                          child: Text(
                            "Done",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
