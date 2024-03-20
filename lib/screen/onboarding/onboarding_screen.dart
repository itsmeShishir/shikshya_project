import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: Center(
          child: Column(
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          Image.asset(""),
          const SizedBox(
            height: 100,
          ),
          Text("Hamro Shop"),
          const SizedBox(
            height: 100,
          ),
          Text(
            "Buy and sell the car parts It is the Ecommerce Market for Cars . Interdum dictum tempus, interdum at dignissim metus. Ultricies sed nunc.",
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {},
            child: Text("Get Started"),
          ),
        ],
      )),
    );
  }
}
