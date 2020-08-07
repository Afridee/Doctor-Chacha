
import 'package:doctor_chacha/Screens/onboardingScreen/onboardingScreenFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:introduction_screen/introduction_screen.dart';


//PageDecoration:
const pageDecoration = const PageDecoration(
  titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
  bodyTextStyle: TextStyle(fontSize: 19.0),
  descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  pageColor: Colors.white,
  imagePadding: EdgeInsets.zero,
);

// for building image in the onboarding Screens:
Widget _buildImage(String assetName) {
  return Align(
    child: Image.asset('assets/images/$assetName.png', width: 200.0),
    alignment: Alignment.bottomCenter,
  );
}

//Pages of Onboarding Screen:
final pages = [
  PageViewModel(
    title: "Hi, I'm Daktar Chacha",
    body:
        "Daktar Chacha is a ground breaking initiative to facilitate the next generation of healthcare for Bangladesh.",
    image: _buildImage('doctor_chacha_logo'),
    decoration: pageDecoration,
  ),
  PageViewModel(
    title: "Fractional shares",
    body:
        "Instead of having to buy an entire share, invest any amount you want.",
    image: _buildImage('books_revised'),
    decoration: pageDecoration,
  )
];

//The Main Widget:
class onboarding_Screen_slider extends StatefulWidget {
  @override
  _onboarding_Screen_sliderState createState() =>
      _onboarding_Screen_sliderState();
}

class _onboarding_Screen_sliderState extends State<onboarding_Screen_slider> {
  final introKey = GlobalKey<IntroductionScreenState>();


  @override
  void initState() {
    initialize_userInfoexists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IntroductionScreen(
      key: introKey,
      pages: pages,
      onDone: () {
        afterOnboardingScreens(context);
      },
      onSkip: () {
        afterOnboardingScreens(context);
      },
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
