import 'package:doctor_chacha/Screens/otherServices/other_services.dart';

import '../Screens/info_form/info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Constants.dart';
import '../Screens/loginPages/firebase_auth_service.dart';
import '../Screens/loginPages/loginFunctionalities.dart';
import 'package:provider/provider.dart';


class mainDrawer extends StatefulWidget {
  @override
  _mainDrawerState createState() => _mainDrawerState();
}

class _mainDrawerState extends State<mainDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth  = Provider.of<FirebaseAuthService>(context, listen: true);
    return Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: primaryDark,
                        child: Text(
                          auth.userInfo!=null ? '${auth.userInfo['first_name']}'.toUpperCase().substring(0,1) + '${auth.userInfo['last_name']}'.toUpperCase().substring(0,1) : '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 44
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13.0),
                        child: Text(
                          auth.userInfo!=null ? '${auth.userInfo['first_name']} ${auth.userInfo['last_name']}' : '',
                          style: TextStyle(
                              color: primaryDark,
                              fontSize: 24
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      primaryDark,
                      primaryDark,
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.copy),
                      title: Text(
                        'My Records',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        'My profile',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        var route = new MaterialPageRoute(
                          builder: (BuildContext context) => new infoForm(title: 'Edit profile'),
                        );
                        Navigator.of(context).push(route);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.medical_services),
                      title: Text(
                        'Other services',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        var route = new MaterialPageRoute(
                          builder: (BuildContext context) => new OtherServices(),
                        );
                        Navigator.of(context).push(route);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.security),
                      title: Text(
                        'Reset Password',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text(
                        'Logout',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      onTap: () async {
                        signOut(context);
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.privacy_tip),
                      title: Text(
                        'Terms and Conditions / Privacy',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      onTap: () async {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}