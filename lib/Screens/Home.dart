import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Scaffold(
      body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.green,
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        color: Color(0xff0088ba),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color(0xff00ffed),
        height: 60,
        items: <Widget>[
          FaIcon(FontAwesomeIcons.servicestack, color: Colors.white),
          FaIcon(FontAwesomeIcons.clinicMedical, color: Colors.white),
          Icon(Icons.shopping_cart, size: 30, color: Colors.white)
        ],
        animationDuration: Duration(
            milliseconds: 200
        ),
        animationCurve: Curves.bounceInOut,
        onTap: (index){
          navBarOnTap(index);
        },
      ),
    );
  }
}
