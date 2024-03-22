import 'package:flutter/material.dart';
import 'package:hamroshop/screen/login/login.dart';
import 'package:hamroshop/widget/button.dart';

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
          const Text("Hamro Shop"),
          const SizedBox(
            height: 100,
          ),
          const Text(
            "Buy and sell the car parts It is the Ecommerce Market for Cars . Interdum dictum tempus, interdum at dignissim metus. Ultricies sed nunc.",
          ),
          const SizedBox(
            height: 10,
          ),
          SharedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            text: "Get Started",
          )
        ],
      )),
    );
  }
}
