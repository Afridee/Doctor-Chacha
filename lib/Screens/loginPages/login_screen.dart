import 'RegistrationScreen.dart';
import 'bottomLoginMethods.dart';
import 'emaiLogInStateManagement.dart';
import 'loginButtonStyles.dart';
import 'loginFunctionalities.dart';
import 'loginTextFields.dart';
import 'package:flutter/services.dart';
import '../../Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../../Constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginScreenStateManagement.dart';

class login_page extends StatefulWidget {
  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  //variables:
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  emaiLogInStateClass ELS;
  loginScreenStateClass LS;
  //functions:

  //function 1:

  @override
  void initState() {
    emailTextController = new TextEditingController();
    passwordTextController = new TextEditingController();
    ELS = new emaiLogInStateClass();
    LS = new loginScreenStateClass();

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
        backgroundColor: Color(0xffFFFFFF),
        body: Observer(builder: (context){
          return ModalProgressHUD(
            inAsyncCall: LS.Spinner,
            child: SingleChildScrollView(
              child: Container(
                color: Color(0xffFFFFFF),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          Container(
                            child: FadeAnimation(
                              1.5,
                              Text(
                                'Daktar Chacha',
                                style: GoogleFonts.muli(
                                  textStyle: TextStyle(
                                      fontSize: 30,
                                      color: primaryDark,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: FadeAnimation(
                                  1.5,
                                  FlareActor(
                                      "assets/animations/doctor_chacha_live_icon.flr",
                                      alignment: Alignment.center,
                                      fit: BoxFit.contain,
                                      animation: "blinking"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30, bottom: 30, top: 20),
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
                                        hideText: false,
                                        labelText: 'email',
                                        textController: emailTextController),
                                    loginTextfield(
                                      hideText: true,
                                      labelText: 'password',
                                      textController: passwordTextController,
                                    )
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
                                LS.setSpinner();
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
                                  new RegistrationScreen(
                                      emailTextController:
                                      emailTextController,
                                      passwordTextController:
                                      passwordTextController,
                                      ELS: ELS),
                                );
                                Navigator.of(context).push(route);
                              },
                              child: loginCustomizedButton(buttonText: 'Sign Up'),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Observer(
                            builder: (context) {
                              return Text(ELS.errorWhileSigningIn,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 10.0));
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                            1.5,
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(fontSize: 16, color: Colors.black54),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Forgot your password? ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Click Here',
                                      style: TextStyle(fontSize: 16, color: primaryDark,fontWeight: FontWeight.bold),
                                    )
                                  ]),
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
                          bottomLoginMethods(LS: LS)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
