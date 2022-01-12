import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/view/components/components.dart';
import 'package:fruit_ecommerce/view/login/login_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';


class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 200]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 15.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor:  Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        globalHeader: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () {
                    _onIntroEnd(context);
                  },
                  child: Container(
                      child: Text(
                    "Skip",
                    style: TextStyle(
                        color: Color(0xff898989),
                        fontSize: 14,
                        fontFamily: "Poppins"),
                  )))
            ],
          ),
        ),
        key: introKey,
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
              title: "E Shopping",
              body: "Explore  top organic fruits & grab them",
              image: _buildImage('Component.png'),
              decoration: pageDecoration,
              footer: customIntroductionButton(
                widthbutton: 146,
                heightbutton: 48,
                text: "Next",
                functionOnPressed: () {
                  introKey.currentState?.animateScroll(1);
                },
              )),
          PageViewModel(
              title: "Delivery on the way",
              body: "Get your order by speed delivery",
              image: _buildImage('Component 2 – 1.png'),
              decoration: pageDecoration,
              footer: customIntroductionButton(
                widthbutton: 146,
                heightbutton: 48,
                text: "Next",
                functionOnPressed: () {
                  introKey.currentState?.animateScroll(2);
                },
              )),
          PageViewModel(
            title: "Delivery Arrived",
            body: "Order is arrived at your Place",
            image: _buildImage('Component 3 – 1.png'),
            decoration: pageDecoration,
            footer: customIntroductionButton(
                widthbutton: 146,
                heightbutton: 48,
                functionOnPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => LoginPage()),
                  );
                },
                text: "Get Started"),
          ),
        ],
        showDoneButton: false,
        showNextButton: false,
        showSkipButton: false,
        dotsDecorator: DotsDecorator(
          activeColor: Color(0xff69A03A),
          color: Colors.grey,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
