import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("onboarding"),
        backgroundColor: Colors.blue,
      ),
      body: Container(),
    );
  }
}
