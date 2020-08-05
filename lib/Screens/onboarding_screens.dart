import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

const bodyStyle = TextStyle(fontSize: 19.0);

const pageDecoration = const PageDecoration(
  titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
  bodyTextStyle: bodyStyle,
  descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  pageColor: Colors.white,
  imagePadding: EdgeInsets.zero,
);

Widget _buildImage(String assetName) {
  return Align(
    child: Image.asset('assets/images/$assetName.png', width: 200.0),
    alignment: Alignment.bottomCenter,
  );
}

final pages = [
  PageViewModel(
    title: "Hi, I'm Daktar Chacha",
    body: "Daktar Chacha is a ground breaking initiative to facilitate the next generation of healthcare for Bangladesh.",
    image: _buildImage('doctor_chacha_logo'),
    decoration: pageDecoration,
  ),
  PageViewModel(
    title: "Fractional shares",
    body: "Instead of having to buy an entire share, invest any amount you want.",
    image: _buildImage('books_revised'),
    decoration: pageDecoration,
  )
];

class onboarding_Screen_slider extends StatefulWidget {
  @override
  _onboarding_Screen_sliderState createState() => _onboarding_Screen_sliderState();
}

class _onboarding_Screen_sliderState extends State<onboarding_Screen_slider> {

  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IntroductionScreen(
      key: introKey,
      pages: pages,
      onDone: (){},
      onSkip: (){},
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
