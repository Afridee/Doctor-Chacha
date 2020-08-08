import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctor_chacha/Screens/homeScreens/Services.dart';
import 'file:///F:/Doctor_chscha/doctor_chacha/lib/Screens/homeScreens/MedStore/medicineStore.dart';
import 'package:doctor_chacha/Screens/homeScreens/Cart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;

  navBarOnTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //this little code down here turns off auto rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff00ffed),
              Color(0xff0088ba),
            ]),
          ),
        ),
      ),
      drawer: Drawer(
        elevation: 0.0,
        child: Container(
          decoration: BoxDecoration(
             color: Color(0xff0088ba)
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[services(), medicineStore(), Cart()],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        color: Color(0xff0088ba),
        backgroundColor: Color(0xff00ffed),
        buttonBackgroundColor: Color(0xff00ffed),
        height: 60,
        items: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FaIcon(
              FontAwesomeIcons.servicestack,
              color: Colors.white,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FaIcon(FontAwesomeIcons.clinicMedical,
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
  }
}
