import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/view/introduction/introductionscreen/intro_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // AnimationController _animationController;
  // Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _animationController = new AnimationController(
    //     vsync: this,
    //     duration: new Duration(milliseconds: 500)
    // );
    // _animation = new CurvedAnimation(
    //   parent: _animationController,
    //   curve: Curves.fastLinearToSlowEaseIn,
    // );
    //
    // _animation.addListener(()=> this.setState((){}));
    // _animationController.forward();

    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => IntroScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff69A03A),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
              child: Text(
            "FRUIT MARKET",
            style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Image.asset(
                "assets/images/mix_fruit_png_11.png",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
