
import '../../Screens/onboardingScreen/onboardingScreenFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
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
    body: "your personal healthcare companion",
    image: _buildImage('Daktar_chacha_icon'),
    decoration: pageDecoration,
  ),
  PageViewModel(
    title: "Get the fastest delivery medicine for you.",
    body: "Order medicine and get the delivery in the fastest time in the town",
    image: _buildImage('fast-delivery'),
    decoration: pageDecoration,
  ),
  PageViewModel(
    title: "Contact a doctor instantly",
    body: "Have the luxury to contact a doctor instantly.",
    image: _buildImage('clip-doctor-sent-me-a-message'),
    decoration: pageDecoration,
  ),
  PageViewModel(
    title: "Make an appointment with a doctor",
    body: "Set an appointment with a doctor without any hassel",
    image: _buildImage('clip-doctor-and-patient'),
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
  bool userInfoexists;

  checkIfuserInfoexists() async{
    userInfoexists = await initialize_userInfoexists();
  }

  @override
  void initState() {
    checkIfuserInfoexists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    //this little code down here turns off auto rotation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // TODO: implement build
    return IntroductionScreen(
      key: introKey,
      pages: pages,
      onDone: () {
        afterOnboardingScreens(context, userInfoexists);
      },
      onSkip: () {
        afterOnboardingScreens(context, userInfoexists);
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
