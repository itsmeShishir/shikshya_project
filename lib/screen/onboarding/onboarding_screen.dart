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
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 200,
              ),
              Image.asset(
                "assets/image/logo-no-background.png",
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Hamro Shop",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child:  Text(
                  "Buy and sell the car parts It is the Ecommerce Market for Cars . Interdum dictum tempus, interdum at dignissim metus. Ultricies sed nunc.", style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SharedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                text: "Get Started",
              )
            ],
          ),
        ),
      ),
    );
  }
}
