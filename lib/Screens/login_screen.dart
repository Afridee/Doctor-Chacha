import 'package:doctor_chacha/Services/firebase_auth_service.dart';
import 'package:flutter/services.dart';
import 'package:doctor_chacha/Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:doctor_chacha/Constants.dart';


class login_page extends StatefulWidget {
  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  //variables:
  String email;
  String password;
  String userID;
  bool loogedIn = false;
  bool showSpinner = false;
  String loginError = '';

  //functions:

  //function 1:
  Future<void> LogInWithFacebook(BuildContext context) async{
    final auth  = Provider.of<FirebaseAuthService>(context, listen: false);
    final user = await auth.fbLogin();
    userID = user.uid;
    print(userID);
  }

  Future<void> LogInWIthGoogle(BuildContext context) async{
    final auth  = Provider.of<FirebaseAuthService>(context, listen: false);
    final user = await auth.googleLogin();
    userID = user.uid;
    print(userID);
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //this little code down here turns off auto rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 230,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: MediaQuery.of(context).size.width / 2 - 100,
                          top: 50,
                          width: 200,
                          height: 200,
                          child: FadeAnimation(
                              1.5,
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/doctor_chacha_logo.png'))),
                              )),
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
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (value) {
                                        setState(() {
                                          email = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      obscureText: true,
                                      onChanged: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
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
                              if(email!=null && password!=null){

                              }
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
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          2,
                          InkWell(
                            onTap: () {
                              if(email!=null && password!=null){

                              }
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
                                  "Register",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(loginError,
                            style: TextStyle(
                                color: Colors.red, fontSize: 10.0)),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                          1.5,
                          InkWell(
                            child: Text(
                              "Forgot Password? Click here",
                              style: TextStyle(color: primaryDark, fontWeight: FontWeight.bold),
                            ),
                            onTap: () {

                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Sign-in using', style: TextStyle(fontSize: 20),),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                IconButton(icon: FaIcon(FontAwesomeIcons.facebook), color: Colors.blueAccent, iconSize: 40, onPressed: () async{
                                   LogInWithFacebook(context);
                                },
                                ),
                                Text('Facebook')
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                IconButton(icon: FaIcon(FontAwesomeIcons.google), color: Colors.red,iconSize: 40, onPressed: () async{
                                  LogInWIthGoogle(context);
                                }),
                                Text('Google')
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              children: [
                                IconButton(icon: FaIcon(FontAwesomeIcons.mobile),color: Colors.green,iconSize: 40, onPressed: (){

                                }),
                                Text('Phone')
                              ],

                            )
                          ],
                        )
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
