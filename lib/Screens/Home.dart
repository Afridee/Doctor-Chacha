import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doctor_chacha/Constants.dart';
import 'package:doctor_chacha/Screens/homeScreens/doctorAppointment/doctorAppointment.dart';
import 'package:doctor_chacha/Screens/homeStateManagement.dart';
import 'package:doctor_chacha/Screens/loginPages/loginFunctionalities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctor_chacha/Screens/homeScreens/MedStore/medicineStore.dart';
import 'package:doctor_chacha/Screens/homeScreens/Cart/Cart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  homeStateClass HS;

  navBarOnTap(int pageIndex) {
    HS.setTitlse(pageIndex);
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 1);
    HS = new homeStateClass();
    HS.setTitlse(1);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //this little code down here turns off auto rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return WillPopScope(
      onWillPop: () async => false,
      child: Observer(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
                title: Text(
                  HS.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      primaryLight,
                      primaryDark,
                    ]),
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      signOut(context);
                    },
                  )
                ]),
            drawer: Drawer(
              elevation: 0.0,
              child: Container(
                decoration: BoxDecoration(color: primaryDark),
              ),
            ),
            body: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[doctorAppointment(), medicineStore(), Cart()],
            ),
            bottomNavigationBar: CurvedNavigationBar(
              index: 1,
              color: primaryDark,
              backgroundColor: primaryLight,
              buttonBackgroundColor: primaryLight,
              height: 60,
              items: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(
                    FontAwesomeIcons.hospital,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(FontAwesomeIcons.pills,
                      color: Colors.white, size: 30),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(FontAwesomeIcons.shoppingCart,
                      color: Colors.white, size: 30),
                ),
              ],
              animationDuration: Duration(milliseconds: 200),
              animationCurve: Curves.bounceInOut,
              onTap: (index) {
                navBarOnTap(index);
              },
            ),
          );
        },
      ),
    );
  }
}
