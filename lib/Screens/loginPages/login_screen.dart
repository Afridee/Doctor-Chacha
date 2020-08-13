import 'package:doctor_chacha/Screens/loginPages/RegistrationScreen.dart';
import 'package:doctor_chacha/Screens/loginPages/bottomLoginMethods.dart';
import 'package:doctor_chacha/Screens/loginPages/emaiLogInStateManagement.dart';
import 'package:doctor_chacha/Screens/loginPages/loginButtonStyles.dart';
import 'package:doctor_chacha/Screens/loginPages/loginFunctionalities.dart';
import 'package:doctor_chacha/Screens/loginPages/loginTextFields.dart';
import 'package:flutter/services.dart';
import 'package:doctor_chacha/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:doctor_chacha/Constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:google_fonts/google_fonts.dart';

class login_page extends StatefulWidget {
  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  //variables:
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  bool showSpinner = false;
  emaiLogInStateClass ELS;
  //functions:

  //function 1:

  @override
  void initState() {

    emailTextController = new TextEditingController();
    passwordTextController = new TextEditingController();
    ELS = new emaiLogInStateClass();

    emailTextController.addListener(() {
      ELS.setEmail(emailTextController.text);
    });

    passwordTextController.addListener(() {
      ELS.setPassword(passwordTextController.text);
    });

    super.initState();
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //this little code down here turns off auto rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
        backgroundColor: Color(0xffF0F0F0),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Container(
              color: Color(0xffF0F0F0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: MediaQuery.of(context).size.width / 2 - 360,
                          top: 40,
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: FadeAnimation(
                              1.5,
                              Text(
                                'Daktar\nChacha',
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        color: primaryDark,
                                        fontWeight: FontWeight.w500)),
                              )),
                        ),
                        Positioned(
                          right: MediaQuery.of(context).size.width / 2 - 50,
                          top: 40,
                          width: 200,
                          height: 200,
                          child: FadeAnimation(
                              1.5,
                              FlareActor(
                                  "assets/animations/doctor_chacha_live_icon.flr",
                                  alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                  animation: "blinking")),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.8,
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  loginTextfield(
                                      hideText: false, labelText: 'email', textController: emailTextController),
                                  loginTextfield(
                                      hideText: true, labelText: 'password', textController: passwordTextController,)
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                          2,
                          InkWell(
                            onTap: () {
                              SignInWIthEmail(context, ELS);
                            },
                            child: loginCustomizedButton(buttonText: 'Log In'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          2,
                          InkWell(
                            onTap: () {
                              var route = new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                new  RegistrationScreen(emailTextController: emailTextController,passwordTextController: passwordTextController,ELS: ELS),
                              );
                              Navigator.of(context).push(route);
                            },
                            child:
                                loginCustomizedButton(buttonText: 'Sign Up'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Observer(
                          builder: (context){
                            return Text(ELS.errorWhileSigningIn,
                                style:
                                TextStyle(color: Colors.red, fontSize: 10.0));
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                          1.5,
                          InkWell(
                            child: Text(
                              "Forgot Password? Click here",
                              style: TextStyle(
                                  color: primaryDark,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {},
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Or sign-in using...',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        bottomLoginMethods()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
